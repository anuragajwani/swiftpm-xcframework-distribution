xcodebuild clean build \
  -project MyFramework.xcodeproj \
  -scheme MyFramework \
  -configuration Release \
  -sdk iphonesimulator \
  -derivedDataPath derived_data \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES
  
xcodebuild archive \
  -scheme MyFramework \
  -sdk iphonesimulator \
  -archivePath "archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -create-xcframework \
    -framework archives/ios_devices.xcarchive/Products/Library/Frameworks/MyFramework.framework \
   -framework archives/ios_simulators.xcarchive/Products/Library/Frameworks/MyFramework.framework \
  -output MyFramework.xcframework
