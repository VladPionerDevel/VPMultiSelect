#
# Be sure to run `pod lib lint VPMultiSelect.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VPMultiSelect'
  s.version          = '0.1.0'
  s.summary          = 'A class that allows you to create multi select view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  class that allows you to create multi select views. It is based on a UITableView with the property allowsMultipleSelection = true. To create a multi select view, you need to create an object of this class by initializing it with a parent UIView and an array of elements.
                       DESC

  s.homepage         = 'https://github.com/VladPionerDevel/VPMultiSelect.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pionerdevel@gmail.com' => 'vladpionerdevel@gmail.com' }
  s.source           = { :git => 'https://github.com/VladPionerDevel/VPMultiSelect.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'VPMultiSelect/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VPMultiSelect' => ['VPMultiSelect/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.swift_version = '5.0'
end
