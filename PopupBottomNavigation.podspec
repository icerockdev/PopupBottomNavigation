#
# Be sure to run `pod lib lint PopupBottomNavigation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PopupBottomNavigation'
  s.version          = '0.1.0'
  s.summary          = 'Popup menu with additional tabs for UITabBarController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
You can create TabBar items that will show Popup menu with additional tabs.
                       DESC

  s.homepage         = 'https://github.com/icerockdev/PopupBottomNavigation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE.md' }
  s.author           = { 'Alex009' => 'Aleksey.Mikhailov@icerockdev.com' }
  s.source           = { :git => 'https://github.com/icerockdev/PopupBottomNavigation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'PopupBottomNavigation/Classes/**/*'
  
  s.swift_versions = ['5.0']
  
  # s.resource_bundles = {
  #   'PopupBottomNavigation' => ['PopupBottomNavigation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
