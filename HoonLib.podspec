#
# Be sure to run `pod lib lint HoonLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HoonLib'
  s.version          = '0.1.7'
  s.summary          = 'My Librarys'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '테스트용 라이브러리 pod 프로젝트'

  s.homepage         = 'https://github.com/showthat/HoonLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'showthat' => 'emforhs7605@gmail.com' }
  s.source           = { :git => 'https://github.com/showthat/HoonLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.0'
  
  s.source_files = 'HoonLib/Classes/**/*'
  
#  s.dependency 'CryptoSwift'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.resource_bundles = {
     'HoonLib' => ['HoonLib/Assets/**/*',
                   'HoonLib/Classes/**/*.xib']
  }

  # s.frameworks = 'UIKit', 'MapKit'
  
end
