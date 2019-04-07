source 'https://skizzo99999999@bitbucket.org/teamdeeplymadstudio/cocoapodsspecsinternal.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.3'
use_frameworks!

def shared_pods
    pod 'SwifterSwift', '4.6.0'
    pod 'CocoaLumberjack/Swift', '3.5.1'
    pod 'SwiftyJSON', '4.2.0'
    pod 'Alamofire', '4.7.3'
    pod 'AlamofireNetworkActivityIndicator', '2.3.0'
    pod 'AlamofireImage', '3.4.0'
    pod 'CodableAlamofire', '1.1.1'
    pod 'SwiftSpinner', '1.6.2'
    pod 'SDWebImage', '5.0.0-beta6'
    
end

target 'FlickrWorldAroundMe' do
	project 'FlickrWorldAroundMe'
        shared_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end
