import 'package:flutter_paypal_native/models/approval/addresses.dart';
import 'package:flutter_paypal_native/models/approval/email.dart';
import 'package:flutter_paypal_native/models/approval/name.dart';
import 'package:flutter_paypal_native/models/approval/phones.dart';

class Payer {
  String? userId;
  String? imageUrl;
  Email? email;
  Name? name;
  List<Addresses>? addresses;
  List<Phones>? phones;

  Payer({this.userId, this.email, this.name, this.addresses, this.phones});

  Payer.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'] != null ? Email.fromJson(json['email']) : null;
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(Phones.fromJson(v));
      });
    }
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['name'] = null;
    data['email'] = null;
    if (email != null) {
      data['email'] = email!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    if (phones != null) {
      data['phones'] = phones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
