@echo off
setlocal EnableExtensions DisableDelayedExpansion

rem ============================================================
rem Dynamic File Organizer v2
rem
rem Features:
rem - Processes files ONLY in the same directory as this BAT.
rem - Ignores all existing subfolders.
rem - Skips this BAT file itself.
rem - Detects file type from extension, case-insensitive.
rem - Creates only the folders that are actually needed.
rem - Supports many common/specialized formats.
rem - Unknown extensions go to Others.
rem - If the same filename already exists in the destination,
rem   the source file is skipped and never overwritten.
rem ============================================================

pushd "%~dp0"

echo.
echo ============================================================
echo                  DYNAMIC FILE ORGANIZER
echo ============================================================
echo Target: %CD%
echo ============================================================
echo.

set /a moved=0
set /a skipped=0
set /a errors=0

for /f "delims=" %%F in ('dir /b /a-d "%CD%" 2^>nul') do (
    if /I not "%%~fF"=="%~f0" (
        call :ProcessFile "%%F"
    )
)

echo.
echo ============================================================
echo Finished
echo Moved   : %moved%
echo Skipped : %skipped%
echo Errors  : %errors%
echo ============================================================
echo.
pause

popd
endlocal
exit /b


:ProcessFile
set "file=%~1"
set "ext=%~x1"
set "category="

rem ============================================================
rem IMAGES
rem ============================================================
if /I "%ext%"==".jpg"     set "category=Images"
if /I "%ext%"==".jpeg"    set "category=Images"
if /I "%ext%"==".jfif"    set "category=Images"
if /I "%ext%"==".jpe"     set "category=Images"
if /I "%ext%"==".png"     set "category=Images"
if /I "%ext%"==".gif"     set "category=Images"
if /I "%ext%"==".bmp"     set "category=Images"
if /I "%ext%"==".webp"    set "category=Images"
if /I "%ext%"==".svg"     set "category=Images"
if /I "%ext%"==".ico"     set "category=Images"
if /I "%ext%"==".tif"     set "category=Images"
if /I "%ext%"==".tiff"    set "category=Images"
if /I "%ext%"==".avif"    set "category=Images"
if /I "%ext%"==".heic"    set "category=Images"
if /I "%ext%"==".heif"    set "category=Images"
if /I "%ext%"==".jxl"     set "category=Images"
if /I "%ext%"==".jp2"     set "category=Images"
if /I "%ext%"==".j2k"     set "category=Images"
if /I "%ext%"==".dds"     set "category=Images"
if /I "%ext%"==".exr"     set "category=Images"
if /I "%ext%"==".hdr"     set "category=Images"

rem ============================================================
rem CAMERA / RAW PHOTOGRAPHY
rem ============================================================
if /I "%ext%"==".raw"     set "category=RAW Photos"
if /I "%ext%"==".dng"     set "category=RAW Photos"
if /I "%ext%"==".cr2"     set "category=RAW Photos"
if /I "%ext%"==".cr3"     set "category=RAW Photos"
if /I "%ext%"==".nef"     set "category=RAW Photos"
if /I "%ext%"==".nrw"     set "category=RAW Photos"
if /I "%ext%"==".arw"     set "category=RAW Photos"
if /I "%ext%"==".sr2"     set "category=RAW Photos"
if /I "%ext%"==".srf"     set "category=RAW Photos"
if /I "%ext%"==".orf"     set "category=RAW Photos"
if /I "%ext%"==".rw2"     set "category=RAW Photos"
if /I "%ext%"==".raf"     set "category=RAW Photos"
if /I "%ext%"==".pef"     set "category=RAW Photos"
if /I "%ext%"==".rwl"     set "category=RAW Photos"
if /I "%ext%"==".3fr"     set "category=RAW Photos"
if /I "%ext%"==".x3f"     set "category=RAW Photos"
if /I "%ext%"==".iiq"     set "category=RAW Photos"

rem ============================================================
rem PDF
rem ============================================================
if /I "%ext%"==".pdf"     set "category=PDF"

rem ============================================================
rem DOCUMENTS
rem ============================================================
if /I "%ext%"==".doc"     set "category=Documents"
if /I "%ext%"==".docx"    set "category=Documents"
if /I "%ext%"==".docm"    set "category=Documents"
if /I "%ext%"==".odt"     set "category=Documents"
if /I "%ext%"==".ott"     set "category=Documents"
if /I "%ext%"==".rtf"     set "category=Documents"
if /I "%ext%"==".txt"     set "category=Documents"
if /I "%ext%"==".md"      set "category=Documents"
if /I "%ext%"==".rst"     set "category=Documents"
if /I "%ext%"==".tex"     set "category=Documents"
if /I "%ext%"==".pages"   set "category=Documents"
if /I "%ext%"==".wps"     set "category=Documents"
if /I "%ext%"==".wpd"     set "category=Documents"
if /I "%ext%"==".epub"    set "category=Ebooks"
if /I "%ext%"==".mobi"    set "category=Ebooks"
if /I "%ext%"==".azw"     set "category=Ebooks"
if /I "%ext%"==".azw3"    set "category=Ebooks"
if /I "%ext%"==".fb2"     set "category=Ebooks"
if /I "%ext%"==".cbz"     set "category=Ebooks"
if /I "%ext%"==".cbr"     set "category=Ebooks"

rem ============================================================
rem SPREADSHEETS
rem ============================================================
if /I "%ext%"==".xls"     set "category=Spreadsheets"
if /I "%ext%"==".xlsx"    set "category=Spreadsheets"
if /I "%ext%"==".xlsm"    set "category=Spreadsheets"
if /I "%ext%"==".xlsb"    set "category=Spreadsheets"
if /I "%ext%"==".xltx"    set "category=Spreadsheets"
if /I "%ext%"==".xltm"    set "category=Spreadsheets"
if /I "%ext%"==".csv"     set "category=Spreadsheets"
if /I "%ext%"==".tsv"     set "category=Spreadsheets"
if /I "%ext%"==".ods"     set "category=Spreadsheets"

rem ============================================================
rem PRESENTATIONS
rem ============================================================
if /I "%ext%"==".ppt"     set "category=Presentations"
if /I "%ext%"==".pptx"    set "category=Presentations"
if /I "%ext%"==".pptm"    set "category=Presentations"
if /I "%ext%"==".pps"     set "category=Presentations"
if /I "%ext%"==".ppsx"    set "category=Presentations"
if /I "%ext%"==".odp"     set "category=Presentations"
if /I "%ext%"==".key"     set "category=Presentations"

rem ============================================================
rem VIDEO
rem ============================================================
if /I "%ext%"==".mp4"     set "category=Videos"
if /I "%ext%"==".mkv"     set "category=Videos"
if /I "%ext%"==".avi"     set "category=Videos"
if /I "%ext%"==".mov"     set "category=Videos"
if /I "%ext%"==".wmv"     set "category=Videos"
if /I "%ext%"==".webm"    set "category=Videos"
if /I "%ext%"==".flv"     set "category=Videos"
if /I "%ext%"==".m4v"     set "category=Videos"
if /I "%ext%"==".mpeg"    set "category=Videos"
if /I "%ext%"==".mpg"     set "category=Videos"
if /I "%ext%"==".m2ts"    set "category=Videos"
if /I "%ext%"==".mts"     set "category=Videos"
if /I "%ext%"==".ts"      set "category=Videos"
if /I "%ext%"==".vob"     set "category=Videos"
if /I "%ext%"==".ogv"     set "category=Videos"
if /I "%ext%"==".3gp"     set "category=Videos"

rem ============================================================
rem AUDIO
rem ============================================================
if /I "%ext%"==".mp3"     set "category=Audio"
if /I "%ext%"==".wav"     set "category=Audio"
if /I "%ext%"==".flac"    set "category=Audio"
if /I "%ext%"==".aac"     set "category=Audio"
if /I "%ext%"==".m4a"     set "category=Audio"
if /I "%ext%"==".ogg"     set "category=Audio"
if /I "%ext%"==".oga"     set "category=Audio"
if /I "%ext%"==".opus"    set "category=Audio"
if /I "%ext%"==".wma"     set "category=Audio"
if /I "%ext%"==".aiff"    set "category=Audio"
if /I "%ext%"==".aif"     set "category=Audio"
if /I "%ext%"==".mid"     set "category=Audio"
if /I "%ext%"==".midi"    set "category=Audio"

rem ============================================================
rem ARCHIVES / COMPRESSED
rem ============================================================
if /I "%ext%"==".zip"     set "category=Archives"
if /I "%ext%"==".rar"     set "category=Archives"
if /I "%ext%"==".7z"      set "category=Archives"
if /I "%ext%"==".tar"     set "category=Archives"
if /I "%ext%"==".gz"      set "category=Archives"
if /I "%ext%"==".bz2"     set "category=Archives"
if /I "%ext%"==".xz"      set "category=Archives"
if /I "%ext%"==".lz"      set "category=Archives"
if /I "%ext%"==".lz4"     set "category=Archives"
if /I "%ext%"==".zst"     set "category=Archives"
if /I "%ext%"==".cab"     set "category=Archives"
if /I "%ext%"==".iso"     set "category=Disk Images"
if /I "%ext%"==".img"     set "category=Disk Images"
if /I "%ext%"==".dmg"     set "category=Disk Images"
if /I "%ext%"==".vhd"     set "category=Disk Images"
if /I "%ext%"==".vhdx"    set "category=Disk Images"
if /I "%ext%"==".vmdk"    set "category=Disk Images"

rem ============================================================
rem WINDOWS APPLICATIONS / INSTALLERS
rem ============================================================
if /I "%ext%"==".exe"     set "category=Applications"
if /I "%ext%"==".msi"     set "category=Applications"
if /I "%ext%"==".msix"    set "category=Applications"
if /I "%ext%"==".msixbundle" set "category=Applications"
if /I "%ext%"==".appx"    set "category=Applications"
if /I "%ext%"==".appxbundle" set "category=Applications"
if /I "%ext%"==".com"     set "category=Applications"

rem ============================================================
rem MOBILE APPLICATION PACKAGES
rem ============================================================
if /I "%ext%"==".apk"     set "category=Android Apps"
if /I "%ext%"==".xapk"    set "category=Android Apps"
if /I "%ext%"==".apks"    set "category=Android Apps"
if /I "%ext%"==".aab"     set "category=Android Apps"
if /I "%ext%"==".ipa"     set "category=Mobile Apps"

rem ============================================================
rem SOURCE CODE / PROGRAMMING
rem ============================================================
if /I "%ext%"==".py"      set "category=Code"
if /I "%ext%"==".pyw"     set "category=Code"
if /I "%ext%"==".pyc"     set "category=Code"
if /I "%ext%"==".js"      set "category=Code"
if /I "%ext%"==".mjs"     set "category=Code"
if /I "%ext%"==".cjs"     set "category=Code"
if /I "%ext%"==".ts"      set "category=Code"
if /I "%ext%"==".tsx"     set "category=Code"
if /I "%ext%"==".jsx"     set "category=Code"
if /I "%ext%"==".php"     set "category=Code"
if /I "%ext%"==".java"    set "category=Code"
if /I "%ext%"==".kt"      set "category=Code"
if /I "%ext%"==".kts"     set "category=Code"
if /I "%ext%"==".c"       set "category=Code"
if /I "%ext%"==".h"       set "category=Code"
if /I "%ext%"==".cpp"     set "category=Code"
if /I "%ext%"==".cc"      set "category=Code"
if /I "%ext%"==".cxx"     set "category=Code"
if /I "%ext%"==".hpp"     set "category=Code"
if /I "%ext%"==".cs"      set "category=Code"
if /I "%ext%"==".go"      set "category=Code"
if /I "%ext%"==".rs"      set "category=Code"
if /I "%ext%"==".rb"      set "category=Code"
if /I "%ext%"==".swift"   set "category=Code"
if /I "%ext%"==".dart"    set "category=Code"
if /I "%ext%"==".lua"     set "category=Code"
if /I "%ext%"==".r"       set "category=Code"
if /I "%ext%"==".scala"   set "category=Code"
if /I "%ext%"==".pl"      set "category=Code"
if /I "%ext%"==".asm"     set "category=Code"
if /I "%ext%"==".s"       set "category=Code"

rem ============================================================
rem SHELL / AUTOMATION
rem ============================================================
if /I "%ext%"==".bat"     set "category=Scripts"
if /I "%ext%"==".cmd"     set "category=Scripts"
if /I "%ext%"==".ps1"     set "category=Scripts"
if /I "%ext%"==".psm1"    set "category=Scripts"
if /I "%ext%"==".sh"      set "category=Scripts"
if /I "%ext%"==".bash"    set "category=Scripts"
if /I "%ext%"==".zsh"     set "category=Scripts"
if /I "%ext%"==".fish"    set "category=Scripts"
if /I "%ext%"==".vbs"     set "category=Scripts"
if /I "%ext%"==".vbe"     set "category=Scripts"
if /I "%ext%"==".wsf"     set "category=Scripts"

rem ============================================================
rem WEB
rem ============================================================
if /I "%ext%"==".html"    set "category=Web"
if /I "%ext%"==".htm"     set "category=Web"
if /I "%ext%"==".css"     set "category=Web"
if /I "%ext%"==".scss"    set "category=Web"
if /I "%ext%"==".sass"    set "category=Web"
if /I "%ext%"==".less"    set "category=Web"
if /I "%ext%"==".vue"     set "category=Web"
if /I "%ext%"==".svelte"  set "category=Web"
if /I "%ext%"==".astro"   set "category=Web"

rem ============================================================
rem DATA / CONFIG / STRUCTURED FILES
rem ============================================================
if /I "%ext%"==".json"    set "category=Data & Config"
if /I "%ext%"==".jsonl"   set "category=Data & Config"
if /I "%ext%"==".xml"     set "category=Data & Config"
if /I "%ext%"==".yaml"    set "category=Data & Config"
if /I "%ext%"==".yml"     set "category=Data & Config"
if /I "%ext%"==".toml"    set "category=Data & Config"
if /I "%ext%"==".ini"     set "category=Data & Config"
if /I "%ext%"==".cfg"     set "category=Data & Config"
if /I "%ext%"==".conf"    set "category=Data & Config"
if /I "%ext%"==".env"     set "category=Data & Config"
if /I "%ext%"==".properties" set "category=Data & Config"

rem ============================================================
rem DATABASE
rem ============================================================
if /I "%ext%"==".sql"     set "category=Database"
if /I "%ext%"==".db"      set "category=Database"
if /I "%ext%"==".sqlite"  set "category=Database"
if /I "%ext%"==".sqlite3" set "category=Database"
if /I "%ext%"==".mdb"     set "category=Database"
if /I "%ext%"==".accdb"   set "category=Database"
if /I "%ext%"==".dbf"     set "category=Database"
if /I "%ext%"==".bak"     set "category=Backups"

rem ============================================================
rem NETWORKING / SECURITY
rem ============================================================
if /I "%ext%"==".ovpn"    set "category=Network Config"
if /I "%ext%"==".conf"    set "category=Network Config"
if /I "%ext%"==".pcap"    set "category=Network Captures"
if /I "%ext%"==".pcapng"  set "category=Network Captures"
if /I "%ext%"==".cap"     set "category=Network Captures"
if /I "%ext%"==".har"     set "category=Network Captures"
if /I "%ext%"==".pem"     set "category=Certificates & Keys"
if /I "%ext%"==".crt"     set "category=Certificates & Keys"
if /I "%ext%"==".cer"     set "category=Certificates & Keys"
if /I "%ext%"==".der"     set "category=Certificates & Keys"
if /I "%ext%"==".key"     set "category=Certificates & Keys"
if /I "%ext%"==".csr"     set "category=Certificates & Keys"
if /I "%ext%"==".p12"     set "category=Certificates & Keys"
if /I "%ext%"==".pfx"     set "category=Certificates & Keys"
if /I "%ext%"==".pub"     set "category=Certificates & Keys"
if /I "%ext%"==".ovpn"    set "category=Network Config"
if /I "%ext%"==".mobileconfig" set "category=Network Config"

rem ============================================================
rem VIRTUAL MACHINES / CONTAINERS
rem ============================================================
if /I "%ext%"==".ova"     set "category=Virtual Machines"
if /I "%ext%"==".ovf"     set "category=Virtual Machines"
if /I "%ext%"==".vbox"    set "category=Virtual Machines"
if /I "%ext%"==".vbox-extpack" set "category=Virtual Machines"
if /I "%ext%"==".qcow2"   set "category=Virtual Machines"
if /I "%ext%"==".vhd"     set "category=Virtual Machines"
if /I "%ext%"==".vhdx"    set "category=Virtual Machines"
if /I "%ext%"==".vmdk"    set "category=Virtual Machines"
if /I "%ext%"==".dockerfile" set "category=Containers"

rem ============================================================
rem 3D / CAD / DESIGN
rem ============================================================
if /I "%ext%"==".obj"     set "category=3D & CAD"
if /I "%ext%"==".stl"     set "category=3D & CAD"
if /I "%ext%"==".fbx"     set "category=3D & CAD"
if /I "%ext%"==".blend"   set "category=3D & CAD"
if /I "%ext%"==".dae"     set "category=3D & CAD"
if /I "%ext%"==".3ds"     set "category=3D & CAD"
if /I "%ext%"==".step"    set "category=3D & CAD"
if /I "%ext%"==".stp"     set "category=3D & CAD"
if /I "%ext%"==".iges"    set "category=3D & CAD"
if /I "%ext%"==".igs"     set "category=3D & CAD"
if /I "%ext%"==".dwg"     set "category=3D & CAD"
if /I "%ext%"==".dxf"     set "category=3D & CAD"
if /I "%ext%"==".skp"     set "category=3D & CAD"

if /I "%ext%"==".psd"     set "category=Design"
if /I "%ext%"==".ai"      set "category=Design"
if /I "%ext%"==".eps"     set "category=Design"
if /I "%ext%"==".indd"    set "category=Design"
if /I "%ext%"==".fig"     set "category=Design"
if /I "%ext%"==".xd"      set "category=Design"
if /I "%ext%"==".afdesign" set "category=Design"
if /I "%ext%"==".afphoto" set "category=Design"
if /I "%ext%"==".kra"     set "category=Design"

rem ============================================================
rem FONTS
rem ============================================================
if /I "%ext%"==".ttf"     set "category=Fonts"
if /I "%ext%"==".otf"     set "category=Fonts"
if /I "%ext%"==".woff"    set "category=Fonts"
if /I "%ext%"==".woff2"   set "category=Fonts"
if /I "%ext%"==".eot"     set "category=Fonts"

rem ============================================================
rem SUBTITLES / CAPTIONS
rem ============================================================
if /I "%ext%"==".srt"     set "category=Subtitles"
if /I "%ext%"==".ass"     set "category=Subtitles"
if /I "%ext%"==".ssa"     set "category=Subtitles"
if /I "%ext%"==".sub"     set "category=Subtitles"
if /I "%ext%"==".vtt"     set "category=Subtitles"

rem ============================================================
rem TORRENT / DOWNLOAD METADATA
rem ============================================================
if /I "%ext%"==".torrent" set "category=Torrents"
if /I "%ext%"==".metalink" set "category=Torrents"

rem ============================================================
rem EMAIL / MAILBOX
rem ============================================================
if /I "%ext%"==".eml"     set "category=Email"
if /I "%ext%"==".msg"     set "category=Email"
if /I "%ext%"==".emlx"    set "category=Email"
if /I "%ext%"==".pst"     set "category=Email"
if /I "%ext%"==".ost"     set "category=Email"

rem ============================================================
rem GAME / MOD FILES
rem ============================================================
if /I "%ext%"==".pak"     set "category=Game Files"
if /I "%ext%"==".wad"     set "category=Game Files"
if /I "%ext%"==".bsp"     set "category=Game Files"
if /I "%ext%"==".rom"     set "category=Game Files"
if /I "%ext%"==".sav"     set "category=Game Files"

rem ============================================================
rem SHORTCUTS / LINKS
rem ============================================================
if /I "%ext%"==".lnk"     set "category=Shortcuts"
if /I "%ext%"==".url"     set "category=Shortcuts"
if /I "%ext%"==".webloc"  set "category=Shortcuts"

rem ============================================================
rem 3D / SCIENTIFIC / SPECIAL DATA
rem ============================================================
if /I "%ext%"==".las"     set "category=Specialized Data"
if /I "%ext%"==".laz"     set "category=Specialized Data"
if /I "%ext%"==".fits"    set "category=Specialized Data"
if /I "%ext%"==".h5"      set "category=Specialized Data"
if /I "%ext%"==".hdf5"    set "category=Specialized Data"
if /I "%ext%"==".parquet" set "category=Specialized Data"
if /I "%ext%"==".feather" set "category=Specialized Data"

rem ============================================================
rem FALLBACK
rem ============================================================
if not defined category set "category=Others"

if not exist "%category%\" (
    md "%category%" >nul 2>&1
    if errorlevel 1 (
        echo [ERROR] Cannot create folder "%category%".
        set /a errors+=1
        exit /b
    )
)

if exist "%category%\%file%" (
    echo [SKIP] "%file%" ^> "%category%\" - same filename already exists.
    set /a skipped+=1
    exit /b
)

move /Y "%file%" "%category%\" >nul 2>&1

if errorlevel 1 (
    echo [ERROR] Failed to move "%file%".
    set /a errors+=1
) else (
    echo [MOVE] "%file%" ^> "%category%\"
    set /a moved+=1
)

exit /b
