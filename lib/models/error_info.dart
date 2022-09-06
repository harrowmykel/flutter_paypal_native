import 'package:flutter_paypal_native/models/map_helper.dart';

class FPayPalErrorInfo extends MapHelper {
  String reason = "";
  String orderId = "";
  String error = "";
  String nativeSdkVersion = "";
  String eligibilityDebugID = "";
  String fundingEligibilityDebugID = "";
  String updateClientConfigDebugID = "";
  String lsatUpgradeDebugID = "";
  String fetchPayloadDebugID = "";
  String currencyConversionDebugID = "";
  String finishCheckoutDebugID = "";

  FPayPalErrorInfo fromMap(Map<String, dynamic> data) {
    setMap(data);

    reason = getString("reason");
    orderId = getString("orderId");
    error = getString("error");

    nativeSdkVersion = getString("nativeSdkVersion");
    eligibilityDebugID = getString("eligibilityDebugID");
    fundingEligibilityDebugID = getString("fundingEligibilityDebugID");
    updateClientConfigDebugID = getString("updateClientConfigDebugID");
    lsatUpgradeDebugID = getString("lsatUpgradeDebugID");
    fetchPayloadDebugID = getString("fetchPayloadDebugID");
    currencyConversionDebugID = getString("currencyConversionDebugID");
    finishCheckoutDebugID = getString("finishCheckoutDebugID");

    return this;
  }
}
