Pod::Spec.new do |s|
  
  s.name         = "Lokalise"
  s.version      = "0.2"
  s.summary      = "Lokalise framework for remote localization of iOS applications."
  s.description  = ""

  s.homepage     = "https://lokali.se"
  s.license      = { :type => "Creative Commons CC BY-ND 4.0)"}

  s.author       = { "Fedya Levkin" => "f.levkin@gmail.com" }

  s.platform     = :ios

  s.ios.deployment_target = "7.0"

  s.source = {:git => "git@github.com:Fedya-L/lokalise-ios-framework.git", :tag => s.version}
  
  s.ios.vendored_frameworks = "Lokalise.framework"

  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(inherited)" }
  s.dependency "zipzap", "~> 8.0"

end
