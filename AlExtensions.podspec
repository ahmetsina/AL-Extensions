#
# Be sure to run `pod lib lint AlExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AlExtensions'
  s.version          = '0.1.0'
  s.summary          = 'Useful extensions for Swift.'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ahmetsina/AL-Extensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors           = { 'sonifex' => 'soner.guler@applogist.com', 'ahmetsina' => 'asend.ustem@gmail.com' }
  s.source           = { :git => 'https://github.com/ahmetsina/AL-Extensions.git', :tag => s.version.to_s, :branch => 'swift5' }
  s.swift_version = '4.2'
  s.ios.deployment_target = '9.0'
  s.source_files = 'AlExtensions/Classes/**/*'
  s.frameworks = 'UIKit'
end
