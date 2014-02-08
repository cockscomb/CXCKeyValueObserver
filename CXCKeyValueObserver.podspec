Pod::Spec.new do |s|
  s.name         = "CXCKeyValueObserver"
  s.version      = "0.1.1"
  s.summary      = "CXCKeyValueObserver is wrapping Key Value Observation (KVO) for convenience."
  s.homepage     = "https://github.com/cockscomb/CXCKeyValueObserver"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "cockscomb" => "cockscomb@cockscomb.info" }
  s.social_media_url = "http://twitter.com/cockscomb"
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.source       = { :git => "https://github.com/cockscomb/CXCKeyValueObserver.git", :tag => "#{s.version}" }
  s.source_files  = 'CXCKeyValueObserver'
  s.requires_arc = true
end
