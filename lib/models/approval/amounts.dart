import 'package:flutter_paypal_native/models/approval/unit_price.dart';

class Amounts {
  UnitPrice? handlingFee;
  UnitPrice? insurance;
  UnitPrice? shippingAndHandling;
  UnitPrice? shippingDiscount;
  UnitPrice? subtotal;
  UnitPrice? tax;
  UnitPrice? total;

  Amounts(
      {this.handlingFee,
      this.insurance,
      this.shippingAndHandling,
      this.shippingDiscount,
      this.subtotal,
      this.tax,
      this.total});

  Amounts.fromJson(Map<String, dynamic> json) {
    handlingFee = json['handlingFee'] != null
        ? UnitPrice.fromJson(json['handlingFee'])
        : null;
    insurance = json['insurance'] != null
        ? UnitPrice.fromJson(json['insurance'])
        : null;
    shippingAndHandling = json['shippingAndHandling'] != null
        ? UnitPrice.fromJson(json['shippingAndHandling'])
        : null;
    shippingDiscount = json['shippingDiscount'] != null
        ? UnitPrice.fromJson(json['shippingDiscount'])
        : null;
    subtotal =
        json['subtotal'] != null ? UnitPrice.fromJson(json['subtotal']) : null;
    tax = json['tax'] != null ? UnitPrice.fromJson(json['tax']) : null;
    total = json['total'] != null ? UnitPrice.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (handlingFee != null) {
      data['handlingFee'] = handlingFee!.toJson();
    }
    if (insurance != null) {
      data['insurance'] = insurance!.toJson();
    }
    if (shippingAndHandling != null) {
      data['shippingAndHandling'] = shippingAndHandling!.toJson();
    }
    if (shippingDiscount != null) {
      data['shippingDiscount'] = shippingDiscount!.toJson();
    }
    if (subtotal != null) {
      data['subtotal'] = subtotal!.toJson();
    }
    if (tax != null) {
      data['tax'] = tax!.toJson();
    }
    if (total != null) {
      data['total'] = total!.toJson();
    }
    return data;
  }
}
