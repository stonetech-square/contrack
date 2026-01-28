#!/bin/bash
# build_macos_dmg.sh - Complete macOS build and DMG creation script with code signing

echo "Building macOS release..."
source .env
flutter build macos --release \
  --dart-define=PROJECT_URL="$PROJECT_URL" \
  --dart-define=PROJECT_KEY="$PROJECT_KEY" \
  --dart-define=LOCAL_DB_KEY="$LOCAL_DB_KEY"

echo "🔐 Signing macOS app..."
codesign --deep --force --verify --verbose \
  --sign "Developer ID Application: StoneTech (MZRCT26L89)" \
  --options runtime \
  --timestamp \
  "build/macos/Build/Products/Release/contrack.app"

echo "✅ Verifying app signature..."
codesign --verify --verbose=4 "build/macos/Build/Products/Release/contrack.app"

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

echo "🔐 Signing DMG..."
codesign --sign "Developer ID Application: StoneTech (MZRCT26L89)" \
  --timestamp \
  "build/macos/contrack.dmg"

echo "📤 Notarizing DMG (requires APPLE_ID and APPLE_ID_PASSWORD in .env)..."
if [ -n "$APPLE_ID" ] && [ -n "$APPLE_ID_PASSWORD" ]; then
  xcrun notarytool submit "build/macos/contrack.dmg" \
    --apple-id "$APPLE_ID" \
    --team-id "MZRCT26L89" \
    --password "$APPLE_ID_PASSWORD" \
    --wait
  
  echo "📎 Stapling notarization ticket..."
  xcrun stapler staple "build/macos/contrack.dmg"
  
  echo "✅ Verifying notarization..."
  xcrun stapler validate "build/macos/contrack.dmg"
  echo "✅ DMG notarized successfully!"
else
  echo "⚠️  Skipping notarization (APPLE_ID or APPLE_ID_PASSWORD not set)"
  echo "   Add these to .env to enable notarization"
fi

echo "✅ Done! Signed DMG created at: build/macos/contrack.dmg"
