import 'package:flutter_paypal_native/models/map_helper.dart';

class FPayPalErrorInfo extends MapHelper {
  String reason = "";
  String orderId = "";
  String error = "";
  String nativeSdkVersion = "";

  FPayPalErrorInfo fromMap(Map<String, dynamic> data) {
    setMap(data);

    reason = getString("reason");
    orderId = getString("orderId");
    error = getString("error");
    nativeSdkVersion = getString("nativeSdkVersion");
    return this;
  }
}
