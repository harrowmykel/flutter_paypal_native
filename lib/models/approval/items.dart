import 'package:flutter_paypal_native/models/approval/unit_price.dart';

class Items {
  String? description;
  String? name;
  UnitPrice? unitPrice;
  int? quantity;
  UnitPrice? total;
  String? details;

  Items(
      {this.description,
      this.name,
      this.unitPrice,
      this.quantity,
      this.total,
      this.details});

  Items.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    unitPrice = json['unitPrice'] != null
        ? UnitPrice.fromJson(json['unitPrice'])
        : null;
    quantity = json['quantity'];
    total = json['total'] != null ? UnitPrice.fromJson(json['total']) : null;
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['name'] = name;
    if (unitPrice != null) {
      data['unitPrice'] = unitPrice!.toJson();
    }
    data['quantity'] = quantity;
    if (total != null) {
      data['total'] = total!.toJson();
    }
    data['details'] = details;
    return data;
  }
}
