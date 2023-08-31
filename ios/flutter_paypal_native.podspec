#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_paypal_native.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_paypal_native'
  s.version          = '2.0.0'
  s.summary          = 'Flutter SDK Lib for Paypal.'
  s.description      = <<-DESC
  A native implementation for Paypal with flutter..
                       DESC
  s.homepage         = 'https://github.com/harrowmykel/flutter_paypal_native'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'PayPalCheckout'
  # s.platform = :ios
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
