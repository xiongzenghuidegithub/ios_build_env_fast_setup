# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'GhostApp' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for GhostApp
  pod 'Alamofire', '4.7.3'
  pod 'RxSwift', '4.3.1'
  pod 'RxCocoa', '4.3.1'
end

target 'GhostAppTests' do
  inherit! :search_paths
  # Pods for testing
  pod 'RxSwift', '4.3.1'
  pod 'RxCocoa', '4.3.1'
  pod 'RxBlocking', '4.3.1'
  pod 'RxTest',     '4.3.1'
end

# target 'GhostAppUITests' do
#   inherit! :search_paths
#   # Pods for testing
# end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.3'
      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = '$(inherited)'
      config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = ''
      if config.name == 'Release'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
        else
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      end
    end
  end
end
