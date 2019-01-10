Pod::Spec.new do |s|
 s.name = 'RevelationCoreData'
 s.version = '0.0.1'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'CoreData Provider for Revelation'
 s.homepage = 'http://rahulkatariya.me'
 s.social_media_url = 'https://twitter.com/rahulkatariya91'
 s.authors = { "Rahul Katariya" => "rahulkatariya@me.com" }
 s.source = { :git => "https://github.com/RahulKatariya/RevelationCoreData.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "10.0", :osx => "10.11", :tvos => "10.0", :watchos => "3.0" }
 s.requires_arc = true
 s.dependency 'RevelationAPI'
 s.dependency 'RevelationDomain'

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift", "External/**/*.swift"
     ss.framework  = "Foundation"
 end
end
