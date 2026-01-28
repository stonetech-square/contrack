#!/bin/bash
# build_windows.bat - Windows build script
# Run this on Windows to build the installer locally

echo "Building Windows release..."
source .env
flutter build windows --release \
  --dart-define=PROJECT_URL="$PROJECT_URL" \
  --dart-define=PROJECT_KEY="$PROJECT_KEY" \
  --dart-define=LOCAL_DB_KEY="$LOCAL_DB_KEY"

echo "Creating installer directory..."
mkdir -p build/windows/installer

echo "Building installer with Inno Setup..."
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" windows\installer.iss

echo "Done! Installer created at: build/windows/installer/contrack-setup.exe"
