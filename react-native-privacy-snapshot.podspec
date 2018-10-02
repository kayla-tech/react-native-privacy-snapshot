require "json"

  json = File.read(File.join(__dir__, "package.json"))
  package = JSON.parse(json).deep_symbolize_keys

  Pod::Spec.new do |s|
    s.name = package[:name]
    s.version = package[:version]
    s.license = { type: package[:license] }
    s.homepage = "https://github.com/kayla-tech/react-native-privacy-snapshot"
    s.authors = package[:author]
    s.summary = package[:description]
    s.source = { git: package[:repository][:url] }
    s.source_files = "RCTPrivacySnapshot/*.{h,m}"
    s.platform = :ios, "9.0"

    s.dependency "React"
  end