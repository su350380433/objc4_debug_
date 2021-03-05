# MARK: converted automatically by spec.py. @hgy

Pod::Spec.new do |s|
	s.name = 'Swift-OC'
	s.version = '1.0.2'
	s.description = 'IMYSwift Description.'
	s.license = 'MIT'
	s.summary = 'IMYSwift'
	s.homepage = 'https://meiyou.com'
	s.authors = { 'x' => 'x@x.com' }

	s.source = { :git => 'git@gitlab.meiyou.com:iOS/IMYSwift.git', :branch => 'dev' }
	s.requires_arc = true
	s.ios.deployment_target = '9.0'
	s.swift_version = '5.0'

	s.source_files = 'Source/**/*.{h,m,swift}'
	##s.private_header_files = 'Source/**/*.{h}'
	#debug

	s.resources = 'Resources/**/*.{json,png,jpg,gif,js,xib,eot,svg,ttf,woff,db,sqlite,mp3}',
				  'Resources/Bundles/*.bundle'

s.dependency 'Alamofire'
s.dependency 'Moya'
s.dependency 'SnapKit'
s.dependency 'Kingfisher'
s.dependency 'HandyJSON'
s.dependency 'lottie-ios'
s.dependency 'Toast'
s.dependency 'Toast'
s.dependency 'Toast'
s.dependency 'MYLCommonUI'
s.dependency 'Masonry'


 
end
