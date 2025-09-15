# Changelog

All notable changes to the PDF Compression Automation Suite (PCAS) will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2023-11-30
### Added
- Initial release of PDF Compression Automation Suite
- Core compression functionality using Ghostscript
- Interactive menu system with dual operation modes:
  - Test mode: Compare multiple compression presets on single file
  - Production mode: Process single or multiple files with selected preset
- File management utilities (FileClean.bat)
- PowerShell script launcher (run-ps-script.bat)
- Comprehensive documentation including:
  - README.md with setup and usage instructions
  - TODO.md for development tracking
  - ISSUE_TEMPLATE.md for future bug reporting
- Git ignore rules for proper repository management

### Technical Specifications
- **Core Engine**: PowerShell with Ghostscript integration
- **Compression Presets**: /screen, /ebook, /printer
- **File Handling**: Batch processing capabilities
- **Compatibility**: Windows PowerShell 5.1+
- **Requirements**: Ghostscript 10.06.0+

### Known Limitations
- Hardcoded paths require manual configuration
- Windows-only compatibility
- Basic error handling implementation
- No automated setup process

---

## Versioning Scheme
- **Major version**: Incompatible API changes
- **Minor version**: Backward-compatible functionality additions  
- **Patch version**: Backward-compatible bug fixes

## Maintenance Policy
- Critical bug fixes: Backported to previous minor version
- Security updates: Immediately addressed with patch releases
- Feature requests: Considered for next minor version release