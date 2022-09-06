import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_paypal_native/flutter_paypal_native_method_channel.dart';

void main() {
  MethodChannelFlutterPaypalNative platform = MethodChannelFlutterPaypalNative();
  const MethodChannel channel = MethodChannel('flutter_paypal_native');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
