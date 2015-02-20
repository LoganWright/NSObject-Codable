Pod::Spec.new do |spec|
  spec.name         = 'NSObject+Codable'
  spec.version      = '0.1'
  spec.license      = 'MIT'
  spec.homepage     = 'https://github.com/LoganWright/NSObject-Codable'
  spec.authors      = { 'Logan Wright' => 'logan.william.wright@gmail.com' }
  spec.summary      = 'A category for making NSCoding easy'
  spec.source       = { :git => 'https://github.com/LoganWright/NSObject-Codable.git', :tag => '0.1' }
  spec.source_files = 'NSObject+Codable/Source/*.{h,m}'
  spec.requires_arc = true
end
