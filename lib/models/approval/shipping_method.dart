import 'package:flutter_paypal_native/models/approval/unit_price.dart';

class ShippingMethod {
  String? id;
  bool? selected;
  String? label;
  String? type;
  UnitPrice? amount;

  ShippingMethod({this.id, this.selected, this.label, this.type, this.amount});

  ShippingMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    selected = json['selected'];
    label = json['label'];
    type = json['type'];
    amount = json['amount'] != null ? UnitPrice.fromJson(json['amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['selected'] = selected;
    data['label'] = label;
    data['type'] = type;
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    return data;
  }
}
