import 'package:flutter_paypal_native/models/approval/items.dart';
import 'package:flutter_paypal_native/models/approval/shipping_method.dart';
import 'package:flutter_paypal_native/models/approval/shipping_address.dart';
import 'package:flutter_paypal_native/models/approval/unit_price.dart';

class Cart {
  String? cartId;
  String? intent;
  UnitPrice? total;
  List<Items>? items;
  ShippingAddress? shippingAddress;
  ShippingAddress? billingAddress;
  UnitPrice? totalAllowedOverCaptureAmount;
  List<ShippingMethod>? shippingMethods;

  Cart({
    this.cartId,
    this.intent,
    this.items,
    this.total,
    this.shippingMethods,
    this.shippingAddress,
    this.billingAddress,
    this.totalAllowedOverCaptureAmount,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    intent = json['intent'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    total = json['total'] != null ? UnitPrice.fromJson(json['total']) : null;
    if (json['shippingMethods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shippingMethods'].forEach((v) {
        shippingMethods!.add(ShippingMethod.fromJson(v));
      });
    }
    shippingAddress = json['shippingAddress'] != null
        ? ShippingAddress.fromJson(json['shippingAddress'])
        : null;
    billingAddress = json['billingAddress'] != null
        ? ShippingAddress.fromJson(json['billingAddress'])
        : null;
    totalAllowedOverCaptureAmount =
        json['totalAllowedOverCaptureAmount'] != null
            ? UnitPrice.fromJson(json['totalAllowedOverCaptureAmount'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cartId'] = cartId;
    data['intent'] = intent;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (total != null) {
      data['total'] = total!.toJson();
    }
    if (shippingMethods != null) {
      data['shippingMethods'] =
          shippingMethods!.map((v) => v.toJson()).toList();
    }
    if (shippingAddress != null) {
      data['shippingAddress'] = shippingAddress!.toJson();
    }
    if (billingAddress != null) {
      data['billingAddress'] = billingAddress!.toJson();
    }
    if (totalAllowedOverCaptureAmount != null) {
      data['totalAllowedOverCaptureAmount'] =
          totalAllowedOverCaptureAmount!.toJson();
    }
    return data;
  }
}
