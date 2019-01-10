Pod::Spec.new do |s|
 s.name = 'RevelationAPI'
 s.version = '0.0.1'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'The Movie Database API using Restofire'
 s.homepage = 'http://rahulkatariya.me'
 s.social_media_url = 'https://twitter.com/rahulkatariya91'
 s.authors = { "Rahul Katariya" => "rahulkatariya@me.com" }
 s.source = { :git => "https://github.com/RahulKatariya/RevelationAPI.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "10.0", :osx => "10.11", :tvos => "10.0", :watchos => "3.0" }
 s.requires_arc = true
 s.dependency 'Restofire', '~> 5.0.0-alpha.2'

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.dependency "Restofire", "~> 5.0.0-alpha.1"
     ss.framework  = "Foundation"
 end
end
