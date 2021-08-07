#
# Be sure to run `pod lib lint VisitIOSSdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VisitIOSSdk'
  s.version          = '0.4.0'
  s.summary          = 'Visit Health IOS SDK'
  s.swift_versions = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Visit App SDK to access Visit features from your app'

  s.homepage         = 'https://github.com/VisitApp/visit-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'UNLICENSED', :file => 'LICENSE' }
  s.author           = { '2319795' => 'aditya.ajeet@gmail.com' }
  s.source           = { :git => 'https://github.com/VisitApp/visit-ios-sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform = :ios
  s.ios.deployment_target = '11.0'

  s.source_files = 'VisitIOSSdk/Classes/**/*'
  
  
  s.dependency 'TwilioVideo', '~> 4.4'
  
   s.resource_bundles = {
     'VisitIOSSdk' => ['VisitIOSSdk/Assets/*.png', 'VisitIOSSdk/Classes/*.xib']
   }
   
   s.resources = ['VisitIOSSdk/Assets/*.png']
   
   s.pod_target_xcconfig = {
     'PRODUCT_BUNDLE_IDENTIFIER': 'com.getvisitapp.visitIOSSdk'
   }
   
   s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
   s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
