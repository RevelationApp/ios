# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'Revelation'

target 'RevelationUI-iOS' do
  project 'Shared/RevelationUI/RevelationUI.xcodeproj'
  use_frameworks!
  pod "RxCocoa"
  pod "Reusable"
  pod "SnapKit"
end

target 'RevelationAPI-iOS' do
    project 'Shared/RevelationAPI/RevelationAPI.xcodeproj'
    use_frameworks!
    pod "Restofire", '~> 5.0.0-alpha.2'
    
    target 'RevelationCoreData-iOS' do
        project 'Shared/RevelationCoreData/RevelationCoreData.xcodeproj'
        inherit! :search_paths
    end

end

target 'Revelation' do
  project 'Revelation.xcodeproj'
  use_frameworks!
  
  # Dev Tools
  pod "SwiftFormat/CLI"
  pod "SwiftLint"

  target 'RevelationTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RevelationUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
