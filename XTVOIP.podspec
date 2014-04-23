Pod::Spec.new do |s|
	s.name = 'XTVOIP'
	s.version = '0.0.1'
	s.license = 'MIT'
	s.summary = 'this is background task'
	s.homepage = 'https://github.com/fblife2014/ZKendBackgroundTask'
	s.author = { 'xushao' => 'xushao1990@126.com' }
	s.platform = :ios, '5.0'
	s.source = { :git => 'https://github.com/fblife2014/ZKendBackgroundTask.git',:tag => '0.0.1'}
    s.source_files  = '*.{h,m}'
    s.requires_arc = true
    s.frameworks = 'UIKit','Foundation'
end
