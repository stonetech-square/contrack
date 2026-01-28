---
description: Build macOS installer (.dmg) using create-dmg
---

# Build macOS Installer

This workflow creates a macOS disk image (.dmg) for in-house distribution using `create-dmg`.

## Prerequisites

1. **Install create-dmg** (if building locally):
   ```bash
   brew install create-dmg
   ```

2. **Environment Variables** (required):
   - `PROJECT_URL`: Your Supabase project URL
   - `PROJECT_KEY`: Your Supabase project key
   - `LOCAL_DB_KEY`: Your local database encryption key

## Local Build Steps

### 1. Build Flutter macOS Release

```bash
flutter build macos --release \
  --dart-define=PROJECT_URL="$PROJECT_URL" \
  --dart-define=PROJECT_KEY="$PROJECT_KEY" \
  --dart-define=LOCAL_DB_KEY="$LOCAL_DB_KEY"
```

Or use the existing build script:
```bash
./build_macos.sh
```

### 2. Create DMG Installer

```bash
create-dmg \
  --volname "Contrack Installer" \
  --volicon "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_512.png" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "contrack.app" 200 190 \
  --hide-extension "contrack.app" \
  --app-drop-link 600 185 \
  --no-internet-enable \
  "build/macos/contrack.dmg" \
  "build/macos/Build/Products/Release/contrack.app"
```

The installer will be created at: `build/macos/contrack.dmg`

### Alternative: Using appdmg (if preferred)

1. **Install appdmg**:
   ```bash
   npm install -g appdmg
   ```

2. **Create appdmg.json**:
   ```json
   {
     "title": "Contrack",
     "icon": "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_512.png",
     "background": "installer-background.png",
     "contents": [
       { "x": 448, "y": 344, "type": "link", "path": "/Applications" },
       { "x": 192, "y": 344, "type": "file", "path": "build/macos/Build/Products/Release/contrack.app" }
     ]
   }
   ```

3. **Build DMG**:
   ```bash
   appdmg appdmg.json build/macos/contrack.dmg
   ```

## GitHub Actions Automation

The installer is automatically built on push/merge to `main` branch via GitHub Actions.

### Workflow File Location
`.github/workflows/build-macos-installer.yml`

### Secrets Required (GitHub Repository Settings)
- `PROJECT_URL`
- `PROJECT_KEY`
- `LOCAL_DB_KEY`

### Artifacts
The workflow uploads the installer as a GitHub Actions artifact named `macos-installer`, which can be downloaded from the Actions tab.

## Code Signing (Optional for In-House Distribution)

For in-house distribution, code signing is optional but recommended:

1. **Sign the app** (requires Apple Developer account):
   ```bash
   codesign --deep --force --verify --verbose \
     --sign "Developer ID Application: Your Name (TEAM_ID)" \
     "build/macos/Build/Products/Release/contrack.app"
   ```

2. **Notarize the app** (optional, for Gatekeeper):
   ```bash
   xcrun notarytool submit build/macos/contrack.dmg \
     --apple-id "your@email.com" \
     --team-id "TEAM_ID" \
     --password "app-specific-password" \
     --wait
   ```

## Distribution

1. Download the DMG from GitHub Actions artifacts
2. Share `contrack.dmg` with end users
3. Users open the DMG and drag the app to Applications folder
4. Users may need to allow the app in System Preferences > Security & Privacy if not signed
