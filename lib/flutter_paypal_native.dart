import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paypal_native/models/approval/approval_data.dart';
import 'package:flutter_paypal_native/models/custom/error_info.dart';
import 'package:flutter_paypal_native/models/shipping_change/shipping_info.dart';
import 'flutter_paypal_native_platform_interface.dart';
import 'models/custom/currency_code.dart';

import 'models/custom/environment.dart';
import 'models/custom/purchase_unit.dart';
import 'models/custom/user_action.dart';
import 'models/custom/order_callback.dart';

class FlutterPaypalNative {
  static FlutterPaypalNative? _instance;
  bool _initiated = false;
  final _methodChannel = const MethodChannel('flutter_paypal_native');
  List<FPayPalPurchaseUnit> purchaseUnits = [];
  //default callback does nothing
  FPayPalOrderCallback _callback = FPayPalOrderCallback(
    onCancel: () {},
    onSuccess: (_) {},
    onError: (_) {},
    onShippingChange: (_) {},
  );

  static bool isDebugMode = false;

  ///use FlutterPayPal.instance instead
  FlutterPaypalNative();

  Future<String?> getPlatformVersion() {
    return FlutterPaypalNativePlatform.instance.getPlatformVersion();
  }

  void setPayPalOrderCallback({
    required FPayPalOrderCallback callback,
  }) {
    _callback = callback;
  }

  ///initiate the package
  ///app_id is you application id e.g
  ///com.example.myapp
  Future<FlutterPaypalNative> init({
    //the return url. This is probably your appid://paypalpay
    required String returnUrl,
    //your client id from paypal developer
    required String clientID,
    //which environmanet would you like to use
    required FPayPalEnvironment payPalEnvironment,
    //which currncy would you like to use
    required FPayPalCurrencyCode currencyCode,
    //paynow or continue
    required FPayPalUserAction action,
  }) async {
    _methodChannel.setMethodCallHandler(_handleMethod);
    _initiated = true;

    Map<String, String> data = {
      "returnUrl": returnUrl,
      "clientId": clientID,
      "payPalEnvironment": FPayPalEnvironmentHelper.convertFromEnumToString(
        payPalEnvironment,
      ),
      "currency": FPayPalCurrencyCodeHelper.convertFromEnumToString(
        currencyCode,
      ),
      "userAction": FPayPalUserActionHelper.convertFromEnumToString(
        action,
      ),
    };
    await _methodChannel.invokeMethod<String>(
      'FlutterPaypal#initiate',
      data,
    );
    return instance;
  }

  ///get instance of FlutterPaypal
  static FlutterPaypalNative get instance {
    //check if null and set
    _instance ??= FlutterPaypalNative();
    return _instance!;
  }

  ///adds an item to be purchased
  ///@throws Exception if init()
  ///was not called before this function
  void addPurchaseUnit(FPayPalPurchaseUnit pUnit) {
    if (!_initiated) {
      throw Exception(
        "you must initiate package first. call FlutterPaypal.instance.init()",
      );
    }
    purchaseUnits.add(pUnit);
  }

  ///starts an order of payment
  ///@throws Exception if init()
  ///was not called before this function
  Future<void> makeOrder({
    FPayPalUserAction action = FPayPalUserAction.payNow,
  }) async {
    if (!_initiated) {
      throw Exception(
        "you must initiate package first. call FlutterPaypal.instance.init()",
      );
    }

    String purchaseUnitsData = FPayPalPurchaseUnit.convertListToJson(
      purchaseUnits,
    );

    Map<String, String> data = {
      "purchaseUnits": purchaseUnitsData,
      "userAction": FPayPalUserActionHelper.convertFromEnumToString(
        action,
      ),
    };

    await _methodChannel.invokeMethod<String>('FlutterPaypal#makeOrder', data);
  }

  // Private function that gets called by ObjC/Java
  Future<void> _handleMethod(MethodCall call) async {
    //(call.arguments.cast<String, dynamic>())
    if (call.method == 'FlutterPaypal#onSuccess') {
      _onPayPalOrderSuccess(call.arguments.cast<String, dynamic>());
    } else if (call.method == 'FlutterPaypal#onCancel') {
      _onCancelPayPalOrder();
    } else if (call.method == 'FlutterPaypal#onError') {
      _onPayPalOrderError(call.arguments.cast<String, dynamic>());
    } else if (call.method == 'FlutterPaypal#onShippingChange') {
      _onPayPalOrderShippingChange(call.arguments.cast<String, dynamic>());
    }
  }

  void _onPayPalOrderSuccess(Map<String, dynamic> data) {
    String aData = data['approvalData'] ?? "";
    FPayPalApprovalData success = FPayPalApprovalData();

    try {
      success = FPayPalApprovalData.fromJson(
        jsonDecode(aData),
      );
    } catch (e) {
      if (isDebugMode) debugPrint(e.toString());
    }
    _callback.onSuccess(success);
  }

  void _onCancelPayPalOrder() {
    if (_callback.onCancel != null) {
      _callback.onCancel!();
    }
  }

  void _onPayPalOrderError(Map<String, dynamic> data) {
    FPayPalErrorInfo error = FPayPalErrorInfo();
    try {
      error = error.fromMap(data);
    } catch (e) {
      if (isDebugMode) debugPrint(e.toString());
    }

    if (_callback.onError != null) {
      _callback.onError!(error);
    }
  }

  void _onPayPalOrderShippingChange(Map<String, dynamic> data) {
    FPayPalShippingInfo shipping = FPayPalShippingInfo();
    try {
      shipping = FPayPalShippingInfo().fromMap(data);
    } catch (e) {
      if (isDebugMode) debugPrint(e.toString());
    }

    if (_callback.onShippingChange != null) {
      _callback.onShippingChange!(shipping);
    }
  }

  void removeAllPurchaseItems() {
    purchaseUnits = [];
  }
}
