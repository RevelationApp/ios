# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

workspace 'Revelation'

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

target 'RevelationUI-iOS' do
    project 'Shared/RevelationUI/RevelationUI.xcodeproj'
    use_frameworks!
    
    pod "RxCocoa"
    pod "Reusable"
    pod "SnapKit"
    
    target 'RevelationUITests-iOS' do
        inherit! :search_paths
        # Pods for testing
    end
end

target 'RevelationAPI-iOS' do
    project 'Shared/RevelationAPI/RevelationAPI.xcodeproj'
    use_frameworks!
    
    pod "Restofire", '~> 5.0.0-alpha.2'
    
    target 'RevelationAPITests-iOS' do
        inherit! :search_paths
        # Pods for testing
    end
end

target 'RevelationCoreData-iOS' do
    project 'Shared/RevelationCoreData/RevelationCoreData.xcodeproj'
    use_frameworks!
    
    pod "RevelationAPI", :path => 'Shared/RevelationAPI'
    pod "RevelationDomain", :path => 'Shared/RevelationDomain'
    
    target 'RevelationCoreDataTests-iOS' do
        inherit! :search_paths
        # Pods for testing
    end
end

target 'RevelationDomain-iOS' do
    project 'Shared/RevelationDomain/RevelationDomain.xcodeproj'
    use_frameworks!
    
    target 'RevelationDomainTests-iOS' do
        inherit! :search_paths
        # Pods for testing
    end
end
