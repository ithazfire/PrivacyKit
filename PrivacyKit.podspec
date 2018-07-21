#
# Be sure to run `pod lib lint PrivacyKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PrivacyKit'
  s.version          = '0.1.5'
  s.summary          = 'PrivacyKit provides a data persistent method to present a privacy notice and manage whether privacy was accepted or denied.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
PrivacyKit provides a persistent CoreData method for privacy status and an associated method to present a privacy notice. When enabled
on a UIViewController, the requirePrivacy method checks the current CoreData state and presents the privacy view controller if privacy
has not been accepted.
                       DESC

  s.homepage         = 'https://github.com/ithazfire/PrivacyKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Archdoog' => 'jacob@ithazfire.com' }
  s.source           = { :git => 'https://github.com/ithazfire/PrivacyKit.git', :tag => s.version.to_s }
  s.swift_version    = '4.0'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'PrivacyKit/Classes/**/*.{h,m,swift,xcdatamodeld}'
  s.resources = 'PrivacyKit/Classes/Models/*.xcdatamodeld'
  
  # s.resource_bundles = {
  #   'PrivacyKit' => ['PrivacyKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
