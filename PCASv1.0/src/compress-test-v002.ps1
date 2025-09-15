<#
============================================
          INTERACTIVE PDF COMPRESSION
  Test presets or run production on selected PDFs
============================================
#>

# === SETTINGS / CONFIGURATION ===
$homedir   = 'C:\Users\cniia\Documents\reduce_file'
$pickup    = Join-Path $homedir 'drop'
$completed = Join-Path $homedir 'compressed'
$ghost     = 'C:\Program Files\gs\gs10.06.0\bin\gswin64c.exe'

if (-not (Test-Path $completed)) {
    New-Item -ItemType Directory -Path $completed | Out-Null
}

# === INTERACTIVE MENU ===
Write-Host "`nSelect an option:"
Write-Host "1: Test multiple presets (first PDF only)"
Write-Host "2: Run preferred preset (all or one PDF)"
$choice = Read-Host "Enter 1 or 2"

switch ($choice) {

    "1" {
        # --- TEST MULTIPLE PRESETS ---
        $pdfs = Get-ChildItem -Path $pickup -Filter *.pdf -File | Select-Object -First 1
        if (-not $pdfs) { Write-Host "❌ No PDFs found in '$pickup'"; exit }

        $testPresets = @("/screen","/ebook","/printer")
        foreach ($pdf in $pdfs) {
            foreach ($preset in $testPresets) {
                $suffix = $preset.TrimStart("/")
                $new = Join-Path $completed ("test-$suffix-" + $pdf.Name)
                $Prms = @(
                    "-q","-dNOPAUSE","-dBATCH","-dSAFER",
                    "-sDEVICE=pdfwrite",
                    "-dCompatibilityLevel=1.4",
                    "-dPDFSETTINGS=$preset",
                    "-dSubsetFonts=true",
                    "-dColorImageDownsampleType=/Bicubic",
                    "-dColorImageResolution=144",
                    "-dGrayImageDownsampleType=/Bicubic",
                    "-dGrayImageResolution=144",
                    "-dMonoImageDownsampleType=/Bicubic",
                    "-dMonoImageResolution=144",
                    "-sOutputFile=`"$new`"",
                    "`"$($pdf.FullName)`""
                )
                Write-Host "➡️ Compressing '$($pdf.Name)' with preset $preset..."
                & $ghost @Prms
            }
        }
    }

    "2" {
        # --- PRODUCTION: CHOOSE FILE(S) AND PRESET ---
        $pdfsAll = Get-ChildItem -Path $pickup -Filter *.pdf -File
        if (-not $pdfsAll) { Write-Host "❌ No PDFs found in '$pickup'"; exit }

        Write-Host "`nSelect files to compress:"
        Write-Host "1: All PDFs in folder"
        Write-Host "2: Select a single PDF"
        $fileChoice = Read-Host "Enter 1 or 2"

        switch ($fileChoice) {
            "1" { $pdfs = $pdfsAll }
            "2" {
                Write-Host "Available PDFs:"
                $pdfsAll | ForEach-Object { Write-Host "$($_.Name)" }
                $selected = Read-Host "Enter exact filename"
                $pdfs = $pdfsAll | Where-Object { $_.Name -eq $selected }
                if (-not $pdfs) { Write-Host "❌ File not found"; exit }
            }
            Default { Write-Host "❌ Invalid selection"; exit }
        }

        # Select preferred preset
        Write-Host "`nChoose preset:"
        Write-Host "1: /screen (low quality, smallest)"
        Write-Host "2: /ebook (medium quality)"
        Write-Host "3: /printer (high quality)"
        $presetChoice = Read-Host "Enter 1, 2, or 3"

        switch ($presetChoice) {
            "1" { $preferredPreset = "/screen" }
            "2" { $preferredPreset = "/ebook" }
            "3" { $preferredPreset = "/printer" }
            Default { Write-Host "❌ Invalid preset"; exit }
        }

        foreach ($pdf in $pdfs) {
            $new = Join-Path $completed ("compressed-" + $pdf.Name)
            $Prms = @(
                "-q","-dNOPAUSE","-dBATCH","-dSAFER",
                "-sDEVICE=pdfwrite",
                "-dCompatibilityLevel=1.4",
                "-dPDFSETTINGS=$preferredPreset",
                "-dSubsetFonts=true",
                "-dColorImageDownsampleType=/Bicubic",
                "-dColorImageResolution=144",
                "-dGrayImageDownsampleType=/Bicubic",
                "-dGrayImageResolution=144",
                "-dMonoImageDownsampleType=/Bicubic",
                "-dMonoImageResolution=144",
                "-sOutputFile=`"$new`"",
                "`"$($pdf.FullName)`""
            )
            Write-Host "➡️ Compressing '$($pdf.Name)' with preset $preferredPreset..."
            & $ghost @Prms
        }
    }

    Default {
        Write-Host "❌ Invalid main selection. Run script again."
        exit
    }
}

Write-Host "✅ Compression complete. Check '$completed' folder."

Read-Host "`nPress Enter to exit..."