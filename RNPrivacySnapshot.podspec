require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNPrivacySnapshot"
  s.version      = package['version']
  s.summary      = package['description']

  s.authors      = "Ray Deck"
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.platform     = :ios, "9.0"

  s.module_name  = 'RNPrivacySnapshot'

  s.source       = { :git => "https://github.com/rhdeck/react-native-privacy-snapshot.git", :tag => "#{s.version}" }
  s.source_files  = "ios/**/*.{h,m,swift}"

  s.dependency 'React'
  s.frameworks = 'UIKit'
end