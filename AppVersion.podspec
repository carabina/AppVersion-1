Pod::Spec.new do |s|
  s.name         = "AppVersion.swift"
  s.version      = "1.0"
  s.summary      = "Micro library to display app version within iOS app."
  s.homepage     = "https://github.com/amebalabs/AppVersion"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Kate Belinskaya" => "kate.belinskaya@gmail.com" }
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/amebalabs/AppVersion.git", :tag => s.version }
  s.source_files = "AppVersion/Source/*.swift"
  s.swift_version = "4.2"
end
