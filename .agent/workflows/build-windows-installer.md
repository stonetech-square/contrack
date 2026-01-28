---
description: Build Windows installer (.exe) using Inno Setup
---

# Build Windows Installer

This workflow creates a Windows installer (.exe) for in-house distribution using Inno Setup.

## Prerequisites

1. **Install Inno Setup** (if building locally):
   - Download from: https://jrsoftware.org/isdl.php
   - Install to default location: `C:\Program Files (x86)\Inno Setup 6`

2. **Environment Variables** (required):
   - `PROJECT_URL`: Your Supabase project URL
   - `PROJECT_KEY`: Your Supabase project key
   - `LOCAL_DB_KEY`: Your local database encryption key

## Local Build Steps

### 1. Build Flutter Windows Release

```bash
flutter build windows --release \
  --dart-define=PROJECT_URL="$PROJECT_URL" \
  --dart-define=PROJECT_KEY="$PROJECT_KEY" \
  --dart-define=LOCAL_DB_KEY="$LOCAL_DB_KEY"
```

### 2. Create Inno Setup Script

Create `windows/installer.iss` with the following content:

```iss
#define MyAppName "Contrack"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Your Company"
#define MyAppExeName "contrack.exe"

[Setup]
AppId={{YOUR-UNIQUE-APP-ID}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=..\build\windows\installer
OutputBaseFilename=contrack-setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
```

### 3. Compile Installer

```bash
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" windows\installer.iss
```

The installer will be created at: `build/windows/installer/contrack-setup.exe`

## GitHub Actions Automation

The installer is automatically built on push/merge to `main` branch via GitHub Actions.

### Workflow File Location
`.github/workflows/build-windows-installer.yml`

### Secrets Required (GitHub Repository Settings)
- `PROJECT_URL`
- `PROJECT_KEY`
- `LOCAL_DB_KEY`

### Artifacts
The workflow uploads the installer as a GitHub Actions artifact named `windows-installer`, which can be downloaded from the Actions tab.

## Distribution

1. Download the installer from GitHub Actions artifacts
2. Share `contrack-setup.exe` with end users
3. Users run the installer and follow the setup wizard
4. The app will be installed to `C:\Program Files\Contrack` by default
