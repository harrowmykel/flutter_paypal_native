import 'dart:convert';

import 'package:flutter_paypal_native/models/map_helper.dart';
import 'package:flutter_paypal_native/models/shipping_address.dart';

enum ShippingChangeType { addressChange, optionChange }

class FPayPalShippingInfo extends MapHelper {
  //the pay token
  String payToken = "";
  //the shipping change type (private)
  String _shipingChangeType = "";
  //the shipping options
  List<String> shippingOptions = [];
  //the new shipping type
  ShippingChangeType? shippingChangeType;

  ///the new shipping address
  FPayPalShippingAddress? shippingAddress;

  FPayPalShippingInfo fromMap(Map<String, dynamic> data) {
    //the data is saved in result key
    MapHelper _c = MapHelper()..setMap(data);
    String result = _c.getString("result");

    Map<String, dynamic>? jsonRes;
    try {
      jsonRes = jsonDecode(result);
    } catch (_) {}

    setMap(jsonRes ?? {});

    payToken = getString("payToken");
    Map<String, dynamic>? shippingAddress2 = getMap("shippingAddress");

    shippingAddress = FPayPalShippingAddress().fromMap(shippingAddress2 ?? {});

    _shipingChangeType = getString("shippingChangeType");
    if (_shipingChangeType == "address_change") {
      shippingChangeType = ShippingChangeType.addressChange;
    } else if (_shipingChangeType == "option_change") {
      shippingChangeType = ShippingChangeType.optionChange;
    }
    return this;
  }
}


/***
  {"payToken":" ",
  "paymentId":" ",
  "shippingChangeType":" ShippingChangeType",
  "selectedShippingOption"
  "shippingAddress": {
    "addressLine1":" ",
    "addressLine2":" ",
    "adminArea1":" ",
    "adminArea2":" ",
    "postalCode":" ",
    "countryCode":" "
 },
 "shippingOptions": [
   {
      
     "id":" ",
     "selected":true,
     "label":" ",
     "type": "ShippingType",
     "amount":{
       "currencyCode":"CurrencyCode",
       "value":" "
    }
 }
]
}
 */