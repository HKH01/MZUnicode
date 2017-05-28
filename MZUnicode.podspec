Pod::Spec.new do |s|
    s.name         = "MZUnicode"
    s.version      = "1.0.0"
    s.summary      = " 解决Xcode8及以上版本控制台显示Unicode编码而不显示汉字的问题。"
    s.homepage     = "https://github.com/MJCheung/MZUnicode"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.authors      = { "MJCheung" => "zmzchn@gmail.com" }
    s.platform     = :ios, "7.0"
    s.source       = { :git => "https://github.com/MJCheung/MZUnicode.git", :tag => s.version.to_s }
    s.requires_arc = true
	s.framework = "Foundation"
    s.source_files = "MZUnicode", "*.{h,m}"
end
