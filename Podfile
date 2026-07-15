source 'https://cdn.cocoapods.org/'
platform :ios, '14.0'

# Link PINRemoteImage into the AsyncDisplayKit framework target so
# AS_PIN_REMOTE_IMAGE (__has_include(<PINRemoteImage/PINRemoteImage.h>)) turns on
# and ASPINRemoteImageDownloader (animated-GIF capable) ships in the xcframework.
# Mirrors the Texture.podspec 'PINRemoteImage' subspec dependencies.
target 'AsyncDisplayKit' do
  # Static linkage embeds PINRemoteImage/PINCache/PINOperation *into*
  # AsyncDisplayKit.framework so the shipped xcframework is self-contained
  # (no external @rpath/PINCache.framework the SPM consumer would have to embed).
  use_frameworks! :linkage => :static
  pod 'PINRemoteImage', '~> 3.0.0'
  pod 'PINRemoteImage/PINCache'
end

target :'AsyncDisplayKitTests' do
  platform :ios, '14.0'
  use_frameworks!
  pod 'OCMock', '~>3.9'
  pod 'iOSSnapshotTestCase/Core', '~> 8.0'
end
