import 'package:flutter_paypal_native/models/approval/unit_price.dart';

enum ShippingMethodType { shipping, pickup, shippingAndPickup, none }

class ShippingMethod {
  String? id;
  bool? selected;
  String? label;
  String? _type;
  ShippingMethodType? type;
  UnitPrice? amount;

  ShippingMethod({this.id, this.selected, this.label, this.type, this.amount});

  ShippingMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    selected = json['selected'];
    label = json['label'];
    _type = json['type'];
    if (_type == 'SHIPPING') {
      type = ShippingMethodType.shipping;
    } else if (_type == 'PICKUP') {
      type = ShippingMethodType.pickup;
    } else if (_type == 'SHIPPING_AND_PICKUP') {
      type = ShippingMethodType.shippingAndPickup;
    } else {
      type = ShippingMethodType.none;
    }
    amount = json['amount'] != null ? UnitPrice.fromJson(json['amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['selected'] = selected;
    data['label'] = label;

    if (type == ShippingMethodType.shipping) {
      _type = 'SHIPPING';
    } else if (type == ShippingMethodType.pickup) {
      _type = 'PICKUP';
    } else if (type == ShippingMethodType.shippingAndPickup) {
      _type = 'SHIPPING_AND_PICKUP';
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
