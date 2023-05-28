import 'package:flutter_paypal_native/models/map_helper.dart';

class ShippingChangeAddress extends MapHelper {
  String addressLine1 = "";
  String addressLine2 = "";
  String adminArea1 = "";
  String adminArea2 = "";
  String postalCode = "";
  String countryCode = "";

  ShippingChangeAddress fromJson(Map<String, dynamic> data) {
    setMap(data);
    adminArea1 = getString("adminArea1");
    adminArea2 = getString("adminArea2");
    postalCode = getString("postalCode");
    countryCode = getString("countryCode");
    return this;
  }
}
