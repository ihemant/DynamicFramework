Pod::Spec.new do |spec|

  spec.name         = "DynamicFramework"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/ihemant/DynamicFramework"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "ihemant" => "hemant2406@gmail.com" }

  spec.ios.deployment_target = "11"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/ihemant/DynamicFramework.git", :tag => "#{spec.version}" }
  spec.source_files  = "DynamicFramework/**/*.{h,m}"

end