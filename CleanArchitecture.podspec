Pod::Spec.new do |s|
s.name             = 'CleanArchitecture'
s.version          = '1.14.128'
s.summary          = 'Clean Architecture for iOS'
s.description      = <<-DESC
Clean architecture for iOS apps
DESC
s.homepage         = 'https://github.com/velvetroom/clean-architecture'
s.license          = { :type => "MIT", :file => "LICENSE" }
s.author           = { 'iturbide' => 'clean_architecture@iturbi.de' }
s.platform         = :ios, '9.0'
s.source           = { :git => 'https://github.com/velvetroom/clean-architecture.git', :tag => "v#{s.version}" }
s.source_files     = 'Source/*.swift'
s.swift_version    = '4.2'
s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
s.prefix_header_file = false
s.static_framework = true
end
