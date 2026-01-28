# macOS Code Signing & Notarization Setup Guide

This guide walks you through setting up code signing and notarization for your macOS app.

## What You Need

1. **Apple Developer Account** (paid, $99/year)
2. **Developer ID Application Certificate** from Apple
3. **App-Specific Password** for notarization
4. **Team ID**: `MZRCT26L89` (already configured)

---

## Step 1: Export Your Certificate

### On Your Mac (with Xcode installed):

1. **Open Keychain Access**
2. **Find your certificate**: Search for "Developer ID Application"
3. **Export the certificate**:
   - Right-click → Export "Developer ID Application: StoneTech"
   - Save as: `certificate.p12`
   - Set a password (you'll need this later)

### Convert to Base64 for GitHub:

```bash
base64 -i certificate.p12 | pbcopy
```
{I)H"EB@i;95kXA[\NpfT_

This copies the base64-encoded certificate to your clipboard.




---

## Step 2: Create App-Specific Password

1. Go to [appleid.apple.com](https://appleid.apple.com)
2. Sign in with your Apple ID
3. Navigate to **Security** → **App-Specific Passwords**
4. Click **Generate an app-specific password**
5. Name it: "Contrack Notarization"
6. **Save the password** (you can't see it again!)
ybwu-pcum-ynok-aawb
---

## Step 3: Configure GitHub Secrets

Go to your repository: **Settings → Secrets and variables → Actions → New repository secret**

Add these 5 secrets:

| Secret Name | Value | Description |
|-------------|-------|-------------|
| `MACOS_CERTIFICATE` | `<base64 from Step 1>` | Base64-encoded .p12 certificate |
| `MACOS_CERTIFICATE_PASSWORD` | `<password from Step 1>` | Password you set when exporting |
| `APPLE_ID` | `your@email.com` | Your Apple ID email |
| `APPLE_ID_PASSWORD` | `<password from Step 2>` | App-specific password |
| `APPLE_TEAM_ID` | `MZRCT26L89` | Your team ID |

---

## Step 4: Update Local .env (Optional)

For local builds with notarization, add to your `.env`:

```bash
# Existing variables
PROJECT_URL="..."
PROJECT_KEY="..."
LOCAL_DB_KEY="..."

# New for notarization (optional)
APPLE_ID="your@email.com"
APPLE_ID_PASSWORD="your-app-specific-password"
```

**Note**: Local builds will sign the app but skip notarization if these aren't set.

---

## How It Works

### GitHub Actions Workflow

When you push to `main`:

1. ✅ **Build** Flutter macOS app
2. ✅ **Import certificate** into temporary keychain
3. ✅ **Sign app** with Developer ID
4. ✅ **Create DMG** installer
5. ✅ **Sign DMG** with Developer ID
6. ✅ **Submit to Apple** for notarization (waits for approval)
7. ✅ **Staple ticket** to DMG (embeds notarization proof)
8. ✅ **Upload** signed & notarized DMG

### Local Build

```bash
./build_macos_dmg.sh
```

This will:
- Build and sign the app
- Create and sign the DMG
- Notarize (if `APPLE_ID` and `APPLE_ID_PASSWORD` are in `.env`)

---

## What is Notarization?

**Notarization** is Apple's automated malware scanning:

| Without Notarization | With Notarization |
|---------------------|-------------------|
| ❌ Scary warning: "Cannot verify developer" | ✅ Opens normally |
| ❌ Users must right-click → Open | ✅ No extra steps |
| ❌ Looks unprofessional | ✅ Professional distribution |

**Process:**
1. You submit your signed app to Apple
2. Apple scans for malware and code issues
3. Apple returns a "notarization ticket"
4. You "staple" the ticket to your DMG
5. macOS Gatekeeper trusts your app

**Time**: Usually 1-5 minutes (automated)

---

## Verification

### Check if app is signed:
```bash
codesign --verify --verbose=4 "build/macos/Build/Products/Release/contrack.app"
```

### Check if DMG is notarized:
```bash
xcrun stapler validate "build/macos/contrack.dmg"
```

### View signature details:
```bash
codesign -dv --verbose=4 "build/macos/Build/Products/Release/contrack.app"
```

---

## Troubleshooting

### "No identity found" error
- Make sure your certificate is valid and not expired
- Check that certificate is "Developer ID Application" (not "Mac App Distribution")

### Notarization fails
- Verify your Apple ID and app-specific password are correct
- Check that your app is properly signed with `--options runtime`
- View detailed logs: `xcrun notarytool log <submission-id>`

### Certificate expired
- Renew in Apple Developer portal
- Export new certificate and update `MACOS_CERTIFICATE` secret

---

## Cost & Requirements

- **Apple Developer Program**: $99/year
- **Certificate validity**: 5 years (then renew)
- **No per-app fees** for notarization

---

## Next Steps

1. ✅ Export your certificate (Step 1)
2. ✅ Create app-specific password (Step 2)
3. ✅ Add all 5 GitHub secrets (Step 3)
4. ✅ Push to `main` to test automated signing
5. ✅ Download DMG and verify it opens without warnings

**Your app will now be properly signed and notarized for professional distribution!**
