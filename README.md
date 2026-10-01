# Windows Dynamic File Organizer

![Dynamic File Organizer](assets/dynamic-file-organizer.png)

[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Script](https://img.shields.io/badge/Script-Batch%20%2Ebat-111111?style=for-the-badge&logo=gnubash&logoColor=white)](#)
[![No Installation](https://img.shields.io/badge/Installation-None-2EA44F?style=for-the-badge)](#requirements)
[![Dynamic](https://img.shields.io/badge/Organization-Dynamic-8A2BE2?style=for-the-badge)](#how-it-works)
[![Format Support](https://img.shields.io/badge/File%20Formats-Wide%20Support-FF7A00?style=for-the-badge)](#supported-file-categories)
[![License](https://img.shields.io/badge/License-MIT-22C55E?style=for-the-badge)](LICENSE)

A lightweight Windows batch script that automatically organizes files in a folder based on their file format.

The script scans the folder where it is placed, identifies each file by its extension, creates only the required category folders, and moves the files into the appropriate locations.

It is designed to be portable, dependency-free, and easy to use.

## ✨ Features

- 🧠 Dynamic categorization
  - Creates folders only for categories that are actually needed.
- 📂 Folder-local processing
  - Processes files in the same folder as the script.
  - Existing subfolders are not scanned or reorganized.
- 🔎 Wide format coverage
  - Handles common office, media, archive, developer, networking, security, mobile, RAW photography, virtualization, and specialized formats.
- 🛡️ Duplicate protection
  - If the destination already contains a file with the same name, the source file is skipped.
  - Existing files are not overwritten.
- 💾 Filename preservation
  - Original filenames remain unchanged.
- 📦 Portable
  - No installer.
  - No external runtime.
  - No Python, PowerShell module, or third-party dependency required.
- 🧩 Unknown-format fallback
  - Unrecognized extensions are placed into `Others`.
- 📊 Simple operation summary
  - Shows moved, skipped, and failed files after execution.

## 📌 How It Works

The organizer follows this flow:

```text
Folder
  │
  ├── Scan files in the current directory
  │
  ├── Read file extension
  │
  ├── Map extension → category
  │
  ├── Create category folder when needed
  │
  └── Move the file
```

For example, a folder like this:

```text
MyFolder/
├── photo.heic
├── camera.cr3
├── report.pdf
├── data.xlsx
├── video.mp4
├── music.flac
├── app.apk
├── vpn-config.ovpn
├── capture.pcapng
├── backup.zip
├── script.py
├── installer.exe
└── dynamic-file-organizer.bat
```

becomes:

```text
MyFolder/
├── Images/
│   └── photo.heic
├── RAW Photos/
│   └── camera.cr3
├── PDF/
│   └── report.pdf
├── Spreadsheets/
│   └── data.xlsx
├── Videos/
│   └── video.mp4
├── Audio/
│   └── music.flac
├── Android Apps/
│   └── app.apk
├── Network Config/
│   └── vpn-config.ovpn
├── Network Captures/
│   └── capture.pcapng
├── Archives/
│   └── backup.zip
├── Code/
│   └── script.py
├── Applications/
│   └── installer.exe
└── dynamic-file-organizer.bat
```

Only the folders required by the files present in the source directory are created.

## 🚀 Quick Start

### 1. Download the script

Download:

```text
dynamic-file-organizer.bat
```

### 2. Put it in the folder you want to organize

Example:

```text
C:\Users\YourName\Downloads\
```

The folder can contain any supported file types.

### 3. Run the script

Double-click:

```text
dynamic-file-organizer.bat
```

You can also run it from Command Prompt:

```cmd
cd /d "C:\Users\YourName\Downloads"
dynamic-file-organizer.bat
```

### 4. Check the result

The script creates the appropriate category folders and moves the files automatically.

## 🗂️ Supported File Categories

The current script includes mappings for these categories.

| Category | Example Extensions |
|---|---|
| Images | `.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`, `.webp`, `.svg`, `.heic`, `.heif`, `.avif`, `.tiff`, `.ico`, `.jxl` |
| RAW Photos | `.raw`, `.dng`, `.cr2`, `.cr3`, `.nef`, `.nrw`, `.arw`, `.sr2`, `.orf`, `.rw2`, `.raf`, `.pef`, `.rwl`, `.3fr`, `.x3f`, `.iiq` |
| PDF | `.pdf` |
| Documents | `.doc`, `.docx`, `.docm`, `.odt`, `.rtf`, `.txt`, `.md`, `.rst`, `.tex`, `.pages`, `.wps`, `.wpd` |
| Ebooks | `.epub`, `.mobi`, `.azw`, `.azw3`, `.fb2`, `.cbz`, `.cbr` |
| Spreadsheets | `.xls`, `.xlsx`, `.xlsm`, `.xlsb`, `.xltx`, `.xltm`, `.csv`, `.tsv`, `.ods` |
| Presentations | `.ppt`, `.pptx`, `.pptm`, `.pps`, `.ppsx`, `.odp`, `.key` |
| Videos | `.mp4`, `.mkv`, `.avi`, `.mov`, `.wmv`, `.webm`, `.flv`, `.m4v`, `.mpeg`, `.mpg`, `.m2ts`, `.mts`, `.vob`, `.ogv`, `.3gp` |
| Audio | `.mp3`, `.wav`, `.flac`, `.aac`, `.m4a`, `.ogg`, `.oga`, `.opus`, `.wma`, `.aiff`, `.aif`, `.mid`, `.midi` |
| Archives | `.zip`, `.rar`, `.7z`, `.tar`, `.gz`, `.bz2`, `.xz`, `.lz`, `.lz4`, `.zst`, `.cab` |
| Disk Images | `.iso`, `.img`, `.dmg` |
| Applications | `.exe`, `.msi`, `.msix`, `.msixbundle`, `.appx`, `.appxbundle`, `.com` |
| Android Apps | `.apk`, `.xapk`, `.apks`, `.aab` |
| Mobile Apps | `.ipa` |
| Code | `.py`, `.pyw`, `.pyc`, `.js`, `.mjs`, `.cjs`, `.ts`, `.tsx`, `.jsx`, `.php`, `.java`, `.kt`, `.kts`, `.c`, `.h`, `.cpp`, `.cc`, `.cxx`, `.hpp`, `.cs`, `.go`, `.rs`, `.rb`, `.swift`, `.dart`, `.lua`, `.r`, `.scala`, `.pl`, `.asm`, `.s` |
| Scripts | `.bat`, `.cmd`, `.ps1`, `.psm1`, `.sh`, `.bash`, `.zsh`, `.fish`, `.vbs`, `.vbe`, `.wsf` |
| Web | `.html`, `.htm`, `.css`, `.scss`, `.sass`, `.less`, `.vue`, `.svelte`, `.astro` |
| Data & Config | `.json`, `.jsonl`, `.xml`, `.yaml`, `.yml`, `.toml`, `.ini`, `.cfg`, `.conf`, `.env`, `.properties` |
| Database | `.sql`, `.db`, `.sqlite`, `.sqlite3`, `.mdb`, `.accdb`, `.dbf` |
| Backups | `.bak` |
| Network Config | `.ovpn`, `.mobileconfig` |
| Network Captures | `.pcap`, `.pcapng`, `.cap`, `.har` |
| Certificates & Keys | `.pem`, `.crt`, `.cer`, `.der`, `.key`, `.csr`, `.p12`, `.pfx`, `.pub` |
| Virtual Machines | `.ova`, `.ovf`, `.vbox`, `.vbox-extpack`, `.qcow2`, `.vhd`, `.vhdx`, `.vmdk` |
| Containers | `.dockerfile` |
| 3D & CAD | `.obj`, `.stl`, `.fbx`, `.blend`, `.dae`, `.3ds`, `.step`, `.stp`, `.iges`, `.igs`, `.dwg`, `.dxf`, `.skp` |
| Design | `.psd`, `.ai`, `.eps`, `.indd`, `.fig`, `.xd`, `.afdesign`, `.afphoto`, `.kra` |
| Fonts | `.ttf`, `.otf`, `.woff`, `.woff2`, `.eot` |
| Subtitles | `.srt`, `.ass`, `.ssa`, `.sub`, `.vtt` |
| Torrents | `.torrent`, `.metalink` |
| Email | `.eml`, `.msg`, `.emlx`, `.pst`, `.ost` |
| Game Files | `.pak`, `.wad`, `.bsp`, `.rom`, `.sav` |
| Shortcuts | `.lnk`, `.url`, `.webloc` |
| Specialized Data | `.las`, `.laz`, `.fits`, `.h5`, `.hdf5`, `.parquet`, `.feather` |
| Others | Unknown or unmapped extensions |

> The mapping is extension-based. A file is categorized according to the extension rules currently defined in the `.bat` script.

## 🔐 File Handling Rules

The script follows these rules when organizing files:

```text
✓ Only files in the current directory are processed
✓ Existing subfolders are ignored
✓ The organizer script does not move itself
✓ File names are preserved
✓ Destination folders are created only when necessary
✓ Duplicate destination names are skipped
✓ Unknown extensions go to Others
✓ The script does not intentionally delete files
```

The script reports the result at the end:

```text
Moved   : X
Skipped : Y
Errors  : Z
```

## 🧪 Example Output

```text
============================================================
                  DYNAMIC FILE ORGANIZER
============================================================
Target: C:\Users\User\Downloads
============================================================

[MOVE] "photo.heic" > "Images\"
[MOVE] "camera.cr3" > "RAW Photos\"
[MOVE] "report.pdf" > "PDF\"
[MOVE] "app.apk" > "Android Apps\"
[MOVE] "capture.pcapng" > "Network Captures\"
[SKIP] "report.pdf" > "PDF\" - same filename already exists.

============================================================
Finished
Moved   : 5
Skipped : 1
Errors  : 0
============================================================
```

## 💻 Requirements

- Windows with Command Prompt support
- No additional installation required
- No internet connection required
- No third-party dependency

## 📁 Repository Structure

```text
windows-dynamic-file-organizer/
├── dynamic-file-organizer.bat
├── assets/
│   └── dynamic-file-organizer.png
├── README.md
└── LICENSE
```

## 🛠️ Customizing Categories

The category mapping is stored directly inside the batch script.

To add a new format, add a rule such as:

```bat
if /I "%ext%"==".example" set "category=My Category"
```

For example:

```bat
if /I "%ext%"==".figma" set "category=Design"
```

After saving the script, files using `.figma` will be handled by the new category rule.

## ⚠️ Current Limitations

The script uses file extensions to determine categories.

That means:

```text
example.apk
```

is recognized as an Android application package, while:

```text
example
```

with no extension has no reliable type information available to the current batch logic and will fall back to `Others`.

The script also does not inspect the internal binary structure, MIME type, magic bytes, or file metadata.

## 🧭 Roadmap

Possible future improvements:

- [ ] Smart file-type detection using file signatures / magic bytes
- [ ] Automatic discovery of previously unknown extensions
- [ ] Preview mode before moving files
- [ ] Undo / rollback support
- [ ] Configurable category rules
- [ ] Custom destination folders
- [ ] Log file generation
- [ ] Duplicate handling with automatic renaming
- [ ] Recursive organization mode
- [ ] GUI version
- [ ] PowerShell version with richer file metadata detection

## 🤝 Contributing

Contributions are welcome.

Useful contributions include:

- Adding missing file extensions
- Improving category mappings
- Fixing Windows compatibility issues
- Improving logging and error handling
- Adding tests or validation scripts
- Improving documentation

When adding a new extension, keep the category name consistent with the existing organization model.

## 📜 License

This project is licensed under the MIT License.

See the `LICENSE` file for details.

## ⭐ Project Goal

The goal of this project is simple:

```text
Messy Folder
     ↓
Run One Script
     ↓
Automatically Categorized
     ↓
Clean Workspace
```

No installer. No complicated setup. Just place the script in a folder and run it.
