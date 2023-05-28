import 'package:flutter_paypal_native/models/shipping_change/unit_amount.dart';

enum ShippingOptionType { shipping, pickup, unknown }

class ShippingOption {
  String? id;
  bool? selected;
  String? label;
  String? _type;
  ShippingOptionType? type;
  UnitAmount? amount;

  ShippingOption({this.id, this.selected, this.label, this.type, this.amount});

  ShippingOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    selected = json['selected'];
    label = json['label'];
    _type = json['type'];
    if (_type == 'PICKUP') {
      type = ShippingOptionType.pickup;
    } else if (_type == 'SHIPPING') {
      type = ShippingOptionType.shipping;
    } else {
      type = ShippingOptionType.unknown;
    }
    amount =
        json['amount'] != null ? UnitAmount.fromJson(json['amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['selected'] = selected;
    data['label'] = label;
    if (type == ShippingOptionType.pickup) {
      _type = 'PICKUP';
    } else if (type == ShippingOptionType.shipping) {
      _type = 'SHIPPING';
    } else {
      _type = 'unknown';
    }
    data['type'] = _type;
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    return data;
  }
}
