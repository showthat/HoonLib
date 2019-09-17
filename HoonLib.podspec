#
# Be sure to run `pod lib lint HoonLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HoonLib'
  s.version          = '0.1.3'
  s.summary          = 'A short description of HoonLib.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "My library"

  s.homepage         = 'https://github.com/showthat/HoonLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'showthat' => 'emforhs7605@gmail.com' }
  s.source           = { :git => 'https://github.com/showthat/HoonLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'
  
  s.source_files = 'HoonLib/Classes/**/*'
  
  s.dependency 'CryptoSwift'
  
  
  # s.resource_bundles = {
  #   'HoonLib' => ['HoonLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
