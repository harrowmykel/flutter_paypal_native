import 'package:flutter_paypal_native/models/approval/cart.dart';
import 'package:flutter_paypal_native/models/approval/payer.dart';

class FPayPalApprovalData {
  String? payerId;
  String? orderId;
  Payer? payer;
  Cart? cart;

  FPayPalApprovalData({
    this.payerId,
    this.orderId,
    this.payer,
    this.cart,
  });

  FPayPalApprovalData.fromJson(Map<String, dynamic> json) {
    payerId = json['payerId'];
    orderId = json['orderId'];
    if (json['payer'] != null) {
      payer = Payer.fromJson(json['payer']);
    }
    if (json['cart'] != null) {
      cart = Cart.fromJson(json['cart']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['payerId'] = payerId;
    data['orderId'] = orderId;
    if (payer != null) {
      data['payer'] = payer!.toJson();
    }
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    return data;
  }
}
