#!/bin/bash
# build_macos_dmg.sh - Complete macOS build and DMG creation script

echo "Building macOS release..."
source .env
flutter build macos --release \
  --dart-define=PROJECT_URL="$PROJECT_URL" \
  --dart-define=PROJECT_KEY="$PROJECT_KEY" \
  --dart-define=LOCAL_DB_KEY="$LOCAL_DB_KEY"

echo "Creating DMG installer..."
create-dmg \
  --volname "Contrack Installer" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "contrack.app" 200 190 \
  --hide-extension "contrack.app" \
  --app-drop-link 600 185 \
  --no-internet-enable \
  "build/macos/contrack.dmg" \
  "build/macos/Build/Products/Release/contrack.app"

echo "Done! DMG created at: build/macos/contrack.dmg"
