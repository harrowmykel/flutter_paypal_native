import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_paypal_native/flutter_paypal_native.dart';
import 'package:flutter_paypal_native/flutter_paypal_native_platform_interface.dart';
import 'package:flutter_paypal_native/flutter_paypal_native_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPaypalNativePlatform
    with MockPlatformInterfaceMixin
    implements FlutterPaypalNativePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPaypalNativePlatform initialPlatform =
      FlutterPaypalNativePlatform.instance;

  test('$MethodChannelFlutterPaypalNative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPaypalNative>());
  });

  test('getPlatformVersion', () async {
    FlutterPaypalNative flutterPaypalNativePlugin = FlutterPaypalNative();
    // MockFlutterPaypalNativePlatform fakePlatform =
    //     MockFlutterPaypalNativePlatform();
    // FlutterPaypalNativePlatform.instance = fakePlatform;
    expect(await flutterPaypalNativePlugin.getPlatformVersion(), '42');
  });
}
