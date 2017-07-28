Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name             = 'ABPasscode'
  s.version          = '0.1'
  s.summary          = ‘This is pass code view controller which can be used for getting secure entry from users.’
  s.description      = <<-DESC
			 A utility control with built in functionality of pass code view that takes inputs in the form secure entry from user. To get the call back methods, you must implement it’s delegate methods to get the code, when user finish entering the passcode.
                       DESC

  s.homepage         = 'https://github.com/asifbilal786/ABPasscodeViewController'
  s.frameworks       = 'UIKit'
  s.requires_arc     = true


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license          = { :type => 'MIT', :file => 'LICENSE' }



  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author           = { 'Asif Bilal' => 'asifbilal786@gmail.com' }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "8.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source           = { :git => 'https://github.com/asifbilal786/ABPasscodeViewController.git', :tag => s.version }
  s.social_media_url = 'https://twitter.com/asifbilal786'

  s.default_subspec  = 'Source'

  s.subspec 'Source' do |sp|
  sp.source_files = 'Pod', 'ABPasscode/Source/*.swift'
  end


end
