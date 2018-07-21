Pod::Spec.new do |s|
s.name             = 'CleanArchitecture'
s.version          = '1.11.108'
s.summary          = 'Clean Architecture for iOS'
s.description      = <<-DESC
Clean architecture for iOS apps
DESC
s.homepage         = 'https://github.com/velvetroom/clean-architecture'
s.license          = { :type => "MIT", :file => "LICENSE" }
s.author           = { 'iturbide' => 'clean_architecture@iturbi.de' }
s.platform         = :ios, '9.0'
s.source           = { :git => 'https://github.com/velvetroom/clean-architecture.git', :tag => "v#{s.version}" }
s.source_files     = 'CleanArchitecture/Source/*.swift'
s.swift_version    = '4.2'
end
