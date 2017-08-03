Pod::Spec.new do |s|

  s.name         = "Lokalise"
  s.version      = "0.6.0"
  s.summary      = "Lokalise framework for OTA localization for iOS."
  s.description  = <<-DESC.gsub(/^ +\|/,'')
                    |No need to resubmit your app for review to update strings or translations anymore
                    |
                    | * Over-the-air (OTA) localization
                    | * Change application language – select any language that is supported by project local localization.
                    | * Test localizations - create pre-release OTA localization bundles for your application. No need to recompile sources. Once the bundles are generated (at Lokalise Download page), see project settings to control versions and pre-release status.
                 DESC

  s.homepage     = "https://lokalise.co"
  s.license      = { :type => "Creative Commons CC BY-ND 4.0" }

  s.author       = { "Fedya Levkin" => "f.levkin@gmail.com" }

  s.platform     = :ios

  s.ios.deployment_target = "8.0"

  s.source = {:git => "https://github.com/lokalise/lokalise-ios-framework.git", :tag => s.version}

  s.ios.vendored_frameworks = "Lokalise.framework"

  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(inherited)" }
  s.dependency "zipzap", "8.1.1"

end
