#!/bin/bash
set -e

FRAMEWORK_NAME="AsyncDisplayKit"
BUILD_DIR="build/xcframework"
ARCHIVES_DIR="$BUILD_DIR/archives"

echo "=== Building $FRAMEWORK_NAME XCFramework ==="

# Clean
rm -rf "$BUILD_DIR"
mkdir -p "$ARCHIVES_DIR"

echo "=== Archiving for iOS device ==="
xcodebuild archive \
  -workspace AsyncDisplayKit.xcworkspace \
  -scheme AsyncDisplayKit \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath "$ARCHIVES_DIR/$FRAMEWORK_NAME-iOS" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "=== Archiving for iOS Simulator ==="
xcodebuild archive \
  -workspace AsyncDisplayKit.xcworkspace \
  -scheme AsyncDisplayKit \
  -configuration Release \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "$ARCHIVES_DIR/$FRAMEWORK_NAME-iOS-Simulator" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "=== Archiving for macOS Catalyst ==="
xcodebuild archive \
  -workspace AsyncDisplayKit.xcworkspace \
  -scheme AsyncDisplayKit \
  -configuration Release \
  -destination "generic/platform=macOS,variant=Mac Catalyst" \
  -archivePath "$ARCHIVES_DIR/$FRAMEWORK_NAME-Catalyst" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "=== Creating XCFramework ==="
xcodebuild -create-xcframework \
  -framework "$ARCHIVES_DIR/$FRAMEWORK_NAME-iOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -framework "$ARCHIVES_DIR/$FRAMEWORK_NAME-iOS-Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -framework "$ARCHIVES_DIR/$FRAMEWORK_NAME-Catalyst.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -output "$BUILD_DIR/$FRAMEWORK_NAME.xcframework"

echo "=== Creating zip for release ==="
cd "$BUILD_DIR"
zip -r "$FRAMEWORK_NAME.xcframework.zip" "$FRAMEWORK_NAME.xcframework"

echo "=== Build complete ==="
echo "XCFramework: $BUILD_DIR/$FRAMEWORK_NAME.xcframework"
echo "Zip file: $BUILD_DIR/$FRAMEWORK_NAME.xcframework.zip"
echo ""
echo "Checksum (for Package.swift):"
swift package compute-checksum "$FRAMEWORK_NAME.xcframework.zip"
