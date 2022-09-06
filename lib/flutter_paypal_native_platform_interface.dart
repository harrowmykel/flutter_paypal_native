import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_paypal_native_method_channel.dart';

abstract class FlutterPaypalNativePlatform extends PlatformInterface {
  /// Constructs a FlutterPaypalPlatform.
  FlutterPaypalNativePlatform() : super(token: _token);

  static final Object _token = Object();

  static MethodChannelFlutterPaypalNative _instance =
      MethodChannelFlutterPaypalNative();

  /// The default instance of [FlutterPaypalPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPaypal].
  static MethodChannelFlutterPaypalNative get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPaypalPlatform] when
  /// they register themselves.
  static set instance(MethodChannelFlutterPaypalNative instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
