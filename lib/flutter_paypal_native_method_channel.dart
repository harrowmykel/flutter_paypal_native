import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_paypal_native_platform_interface.dart';

/// An implementation of [FlutterPaypalPlatform] that uses method channels.
class MethodChannelFlutterPaypalNative extends FlutterPaypalNativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_paypal');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
