Pod::Spec.new do |s|
 s.name = 'RevelationUI'
 s.version = '0.0.1'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Revelation UIKit'
 s.homepage = 'http://rahulkatariya.me'
 s.social_media_url = 'https://twitter.com/rahulkatariya91'
 s.authors = { "Rahul Katariya" => "rahulkatariya@me.com" }
 s.source = { :git => "https://github.com/RahulKatariya/RevelationUI.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "10.0", :osx => "10.11", :tvos => "10.0", :watchos => "3.0" }
 s.requires_arc = true
 s.dependency 'RxCocoa'
 s.dependency 'Reusable'
 s.dependency 'SnapKit'
 s.dependency 'RevelationDomain'

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
    ss.source_files = "Sources/**/*.swift", "External/**/*.swift"
    ss.resources = ["Sources/**/*.xib", "External/**/*.xib"]
    ss.framework = "Foundation"
 end
end
