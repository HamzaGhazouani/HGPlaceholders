#
# Be sure to run `pod lib lint HGPlaceholders.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'HGPlaceholders'
s.version          = '0.4.0'
s.summary          = 'Nice library to show placeholders and Empty States for any UITableView/UICollectionView in your project'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
A powerful framework allows you to show easily different placeholders (no resulats, loading, error occured, ...) and to create Empty States in your table view / collection view, fully customisable
DESC

s.homepage         = 'https://github.com/HamzaGhazouani/HGPlaceholders'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'HamzaGhazouani' => 'hamza.ghazouani@gmail.com' }
s.source           = { :git => 'https://github.com/HamzaGhazouani/HGPlaceholders.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/GhazouaniHamza'

s.ios.deployment_target = '8.0'

s.source_files = 'HGPlaceholders/Classes/**/*'
s.resource = 'HGPlaceholders/Assets/*.*'

end
