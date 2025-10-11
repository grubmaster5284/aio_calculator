# AIO Calculator - Release Instructions

## Overview
This document provides instructions for creating production releases of AIO Calculator across all supported platforms.

## App Information
- **App Name**: AIO Calculator
- **Bundle ID**: com.aio.calculator
- **Version**: 1.0.0+1

## Supported Platforms
- Android (APK & AAB)
- iOS (IPA - requires code signing for distribution)
- macOS (APP)
- Linux (Bundle)
- Windows (Executable)
- Web (Static files)

## Creating a Release

### Automatic Release (Recommended)
1. Create and push a git tag with version number:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. The GitHub Actions workflow will automatically:
   - Build the app for all platforms
   - Create platform-specific archives
   - Generate a GitHub release with all artifacts

### Manual Release
If you need to create a release manually:

1. **Build for all platforms**:
   ```bash
   # Android
   flutter build apk --release
   flutter build appbundle --release
   
   # iOS (requires macOS)
   flutter build ios --release --no-codesign
   
   # macOS (requires macOS)
   flutter build macos --release
   
   # Linux
   flutter build linux --release
   
   # Windows
   flutter build windows --release
   
   # Web
   flutter build web --release
   ```

2. **Create release archives**:
   - Android: Package APK and AAB files
   - iOS: Package the .app bundle
   - macOS: Package the .app bundle
   - Linux: Package the bundle directory
   - Windows: Package the Release directory
   - Web: Package the web build directory

## Release Artifacts

### Android
- `aio-calculator-android.zip` - Contains APK and AAB files
- APK file: `app-release.apk`
- AAB file: `app-release.aab`

### iOS
- `aio-calculator-ios.zip` - Contains the iOS app bundle
- Note: Requires code signing for App Store distribution

### macOS
- `aio-calculator-macos.zip` - Contains the macOS app bundle
- App name: "AIO Calculator.app"

### Linux
- `aio-calculator-linux.tar.gz` - Contains the Linux bundle
- Executable: `aio_calculator`

### Windows
- `aio-calculator-windows.zip` - Contains Windows executable and dependencies
- Executable: `aio_calculator.exe`

### Web
- `aio-calculator-web.zip` - Contains static web files
- Can be deployed to any web server

## Distribution Notes

### Android
- APK can be distributed directly or through Google Play Store
- AAB is required for Google Play Store distribution

### iOS
- Requires Apple Developer account for App Store distribution
- Code signing is required for device installation

### macOS
- Can be distributed through Mac App Store or directly
- Code signing required for Gatekeeper compatibility

### Linux
- Can be distributed as AppImage, Snap, or Flatpak
- Direct distribution of the bundle is also supported

### Windows
- Can be distributed through Microsoft Store or directly
- Code signing recommended for Windows Defender compatibility

### Web
- Can be deployed to any web hosting service
- Supports PWA installation

## Version Management
- Update version in `pubspec.yaml` before creating a release
- Use semantic versioning (e.g., v1.0.0, v1.1.0, v2.0.0)
- Tag releases with `v` prefix (e.g., `v1.0.0`)

## GitHub Actions Workflow
The release workflow is triggered by:
- Pushing a tag starting with 'v'
- Manual workflow dispatch

The workflow builds for all platforms in parallel and creates a single release with all artifacts.
