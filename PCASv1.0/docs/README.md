# PDF Compression Automation Suite

A robust PowerShell-based toolset for automated batch PDF compression using Ghostscript, featuring an interactive menu system and intelligent file management.

## 🚧 Current Status: Development Preview

This is a preliminary version with core functionality established. The tool currently operates as a private utility with some limitations that will be addressed before public release.

### ⚠️ Known Limitations
- **Hardcoded Paths**: Requires manual configuration of file paths
- **Windows-Only**: Currently compatible only with Windows environments  
- **Basic Error Handling**: Limited validation and error recovery mechanisms
- **Manual Setup**: No automated installation process

## 🛠️ Technical Architecture

pdf-compression-suite/
└── PCASv1.0/
    ├── docs/
    │   ├── CHANGELOG.md
    │   ├── CONTRIBUTING.md
    │   ├── ISSUE_TEMPLATE.md
    │   ├── README.md
    │   └── TODO.md
    ├── src/
    │   ├── compress-test-v002.ps1
    │   ├── FileClean.bat
    │   └── run-ps-script.bat
    └── .gitignore

## Project Structure

PCASv1.0/
├── 📁 docs/                    # Documentation files
│ ├── 📄 CHANGELOG.md           # Version history and changes
│ ├── 📄 CONTRIBUTING.md        # Contribution guidelines
│ ├── 📄 ISSUE_TEMPLATE.md      # Bug report template
│ ├── 📄 README.md              # Project overview
│ └── 📄 TODO.md                # Development roadmap
├── 📁 src/                     # Source code
│ ├── 📄 compress-test-v002.ps1 # Main compression script
│ ├── 📄 FileClean.bat          # File management utility
│ └── 📄 run-ps-script.bat      # Script launcher
└── 📄 .gitignore               # Git exclusion rules

## File Descriptions

| File | Purpose |
|------|---------|
| `src/compress-test-v002.ps1` | Main PowerShell script for PDF compression |
| `src/FileClean.bat` | Batch file for organizing processed files |
| `src/run-ps-script.bat` | Launcher for selecting and running PowerShell scripts |
| `docs/CHANGELOG.md` | Tracks version history and changes |
| `docs/CONTRIBUTING.md` | Guidelines for future contributors |
| `docs/ISSUE_TEMPLATE.md` | Template for reporting bugs and issues |
| `docs/README.md` | Comprehensive project documentation |
| `docs/TODO.md` | Development roadmap and task tracking |
| `.gitignore` | Specifies files to exclude from version control |

## 📋 Core Features

### 1. Interactive Menu System
- User-friendly console interface
- Dual operation modes (Test & Production)
- Preset selection and file choosing capabilities

### 2. Compression Engine
- Ghostscript integration with multiple presets:
  - `/screen` - Lowest quality, smallest size
  - `/ebook` - Medium quality, balanced size
  - `/printer` - High quality, larger size
- Batch processing capabilities
- Configurable compression parameters

### 3. File Management
- Automated folder structure
- Batch file renaming and organization
- Input/Output directory management

## 🚀 Quick Start

### Prerequisites
1. **Ghostscript**: Install from [official website](https://www.ghostscript.com/)
2. **Windows PowerShell**: Version 5.1 or newer
3. **File System Permissions**: Write access to target directories

### Manual Setup
1. Clone this repository
2. Update hardcoded paths in `compress-test-v002.ps1`:
   - `$homedir`: Set to your preferred directory
   - `$ghost`: Point to your Ghostscript executable
3. Create required folders manually:
   - `[homedir]/drop` - for source PDFs
   - `[homedir]/compressed` - for output files

### Usage
1. Place PDF files in the `drop` folder
2. Run `run-ps-script.bat` from the `src` directory
3. Follow interactive prompts to select operation mode
4. Processed files will appear in the `compressed` folder
5. Use `FileClean.bat` to organize finished files

## 📊 Roadmap to Version 1.0

### Phase 1: Configuration System [Next]
- [ ] JSON-based configuration file
- [ ] Environment variable support
- [ ] Automated path detection

### Phase 2: Enhanced Reliability
- [ ] Comprehensive error handling
- [ ] Input validation and sanitization
- [ ] Logging system implementation

### Phase 3: User Experience
- [ ] Automated setup script
- [ ] Progress indicators and status reporting
- [ ] Help system and documentation

### Phase 4: Cross-Platform Support
- [ ] PowerShell Core compatibility
- [ ] Linux/macOS support
- [ ] Docker containerization

## 🔧 Development Setup

For contributors (when project goes public):

```bash
git clone https://github.com/your-username/pdf-compression-suite.git
cd pdf-compression-suite
```

## Development instructions to be added

🤝 Future Contribution Guidelines
When this project reaches public release status, contributions will be welcome in these areas:
- Configuration Management: Implement flexible configuration system
- Error Handling: Enhance robustness and user feedback
- Testing: Create test suite and validation procedures
- Documentation: Improve user guides and technical documentation
- UI/UX: Develop graphical interface or web frontend

## 📝 License
Will be determined before public release. Currently for private use only.

## ⚠️ Disclaimer
This is development software. Always test with non-critical files and verify output quality before using in production environments.
