import 'dart:convert';

import 'package:flutter_paypal_native/models/map_helper.dart';
import 'package:flutter_paypal_native/models/shipping_change/shipping_change_address.dart';
import 'package:flutter_paypal_native/models/shipping_change/shipping_option.dart';
import 'package:flutter_paypal_native/models/shipping_options.dart';

enum ShippingChangeType { addressChange, optionChange }

class FPayPalShippingInfo extends MapHelper {
  //the shipping options
  List<FPayPalShippingOptions> shippingOptions = [];
  //the new shipping type
  ShippingChangeType? shippingChangeType;

  ///the new shipping address
  FPayPalShippingChangeAddress? shippingChangeAddress;
  ShippingOption? selectedOption;

  FPayPalShippingInfo fromMap(Map<String, dynamic> data) {
    //the data is saved in result key
    setMap(data);
    String result = getString("result");

    Map<String, dynamic>? jsonRes;
    try {
      jsonRes = jsonDecode(result);
    } catch (_) {}

    setMap(jsonRes ?? {});

    Map<String, dynamic>? shippingChangeAddress2 = getMap(
      "shippingAddress",
    );
    shippingChangeAddress = FPayPalShippingChangeAddress().fromMap(
      shippingChangeAddress2 ?? {},
    );

    List<dynamic>? options2 = getList('shippingOptions');
    if (options2 != null) {
      for (var opt in options2) {
        shippingOptions.add(FPayPalShippingOptions().fromMap(opt));
      }
    }
    Map<String, dynamic>? optionsSelected2 = getMap('selectedShippingOption');
    if (optionsSelected2 != null) {
      selectedOption = ShippingOption.fromJson(optionsSelected2);
    }

    //the shipping change type
    String shipingChangeType2 = getString("shippingChangeType");
    if (shipingChangeType2 == "ADDRESS_CHANGE") {
      shippingChangeType = ShippingChangeType.addressChange;
    } else if (shipingChangeType2 == "OPTION_CHANGE") {
      shippingChangeType = ShippingChangeType.optionChange;
    }
    return this;
  }
}
