Pod::Spec.new do |s|
  s.name         = "VOIPBackground"
  s.version      = "0.0.1"
  s.summary      = "zking tell you how to yunxingcheng in backgroubd"
  s.homepage     = "https://github.com/fblife2014/ZKendBackgroundTask"
  s.license      = 'MIT'
  s.author             = { "shizhongkun" => "shozhongkun@bflife.com" }
  s.source       = { :git => "https://github.com/fblife2014/ZKendBackgroundTask.git", :tag => "0.0.1" }
  s.source_files  = '*.{h,m}'
  s.requires_arc = true
s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
end




