//generated with https://javiercbk.github.io/json_to_dart/
// json source at ROOT/resources/approval.json
class FPayPalApprovalData {
  String? payerId;
  String? orderId;
  String? paymentId;
  Payer? payer;
  Cart? cart;
  VaultData? vaultData;
  String? billingToken;

  FPayPalApprovalData({
    this.payerId,
    this.orderId,
    this.paymentId,
    this.payer,
    this.cart,
    this.vaultData,
    this.billingToken,
  });

  FPayPalApprovalData.fromJson(Map<String, dynamic> json) {
    payerId = json['payerId'];
    orderId = json['orderId'];
    paymentId = json['paymentId'];
    payer = json['payer'] != null ? Payer.fromJson(json['payer']) : null;
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    vaultData = json['vaultData'] != null
        ? VaultData.fromJson(json['vaultData'])
        : null;
    billingToken = json['billingToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['payerId'] = payerId;
    data['orderId'] = orderId;
    data['paymentId'] = paymentId;
    if (payer != null) {
      data['payer'] = payer!.toJson();
    }
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    if (vaultData != null) {
      data['vaultData'] = vaultData!.toJson();
    }
    data['billingToken'] = billingToken;
    return data;
  }
}

class Payer {
  String? userId;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
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

class Email {
  String? value;

  Email({this.value});

  Email.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Value'] = value;
    return data;
  }
}

class Name {
  String? fullName;
  String? givenName;
  String? familyName;

  Name({this.fullName, this.givenName, this.familyName});

  Name.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    givenName = json['givenName'];
    familyName = json['familyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullName'] = fullName;
    data['givenName'] = givenName;
    data['familyName'] = familyName;
    return data;
  }
}

class Addresses {
  bool? isPrimary;
  String? fullAddress;
  String? addressId;
  String? line1;
  String? line2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  bool? isSelected;

  Addresses({
    this.isPrimary,
    this.fullAddress,
    this.addressId,
    this.line1,
    this.line2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.isSelected,
  });

  Addresses.fromJson(Map<String, dynamic> json) {
    isPrimary = json['isPrimary'];
    fullAddress = json['fullAddress'];
    addressId = json['addressId'];
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
    country = json['country'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['isPrimary'] = isPrimary;
    data['fullAddress'] = fullAddress;
    data['addressId'] = addressId;
    data['line1'] = line1;
    data['line2'] = line2;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    data['country'] = country;
    data['isSelected'] = isSelected;
    return data;
  }
}

class Phones {
  String? number;

  Phones({this.number});

  Phones.fromJson(Map<String, dynamic> json) {
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['number'] = number;
    return data;
  }
}

class Cart {
  String? cartId;
  String? intent;
  String? billingType;
  String? paymentId;
  String? billingToken;
  List<Items>? items;
  Amounts? amounts;
  String? description;
  CancelUrl? cancelUrl;
  CancelUrl? returnUrl;
  UnitPrice? total;
  List<ShippingMethods>? shippingMethods;
  ShippingAddress? shippingAddress;
  ShippingAddress? billingAddress;
  UnitPrice? totalAllowedOverCaptureAmount;

  Cart(
      {this.cartId,
      this.intent,
      this.billingType,
      this.paymentId,
      this.billingToken,
      this.items,
      this.amounts,
      this.description,
      this.cancelUrl,
      this.returnUrl,
      this.total,
      this.shippingMethods,
      this.shippingAddress,
      this.billingAddress,
      this.totalAllowedOverCaptureAmount});

  Cart.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    intent = json['intent'];
    billingType = json['billingType'];
    paymentId = json['paymentId'];
    billingToken = json['billingToken'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    amounts =
        json['amounts'] != null ? Amounts.fromJson(json['amounts']) : null;
    description = json['description'];
    cancelUrl = json['cancelUrl'] != null
        ? CancelUrl.fromJson(json['cancelUrl'])
        : null;
    returnUrl = json['returnUrl'] != null
        ? CancelUrl.fromJson(json['returnUrl'])
        : null;
    total = json['total'] != null ? UnitPrice.fromJson(json['total']) : null;
    if (json['shippingMethods'] != null) {
      shippingMethods = <ShippingMethods>[];
      json['shippingMethods'].forEach((v) {
        shippingMethods!.add(ShippingMethods.fromJson(v));
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
    data['billingType'] = billingType;
    data['paymentId'] = paymentId;
    data['billingToken'] = billingToken;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (amounts != null) {
      data['amounts'] = amounts!.toJson();
    }
    data['description'] = description;
    if (cancelUrl != null) {
      data['cancelUrl'] = cancelUrl!.toJson();
    }
    if (returnUrl != null) {
      data['returnUrl'] = returnUrl!.toJson();
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

class UnitPrice {
  String? currencyFormat;
  String? currencyFormatSymbolISOCurrency;
  String? currencyCode;
  String? currencySymbol;
  String? currencyValue;

  UnitPrice(
      {this.currencyFormat,
      this.currencyFormatSymbolISOCurrency,
      this.currencyCode,
      this.currencySymbol,
      this.currencyValue});

  UnitPrice.fromJson(Map<String, dynamic> json) {
    currencyFormat = json['currencyFormat'];
    currencyFormatSymbolISOCurrency = json['currencyFormatSymbolISOCurrency'];
    currencyCode = json['currencyCode'];
    currencySymbol = json['currencySymbol'];
    currencyValue = json['currencyValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['currencyFormat'] = currencyFormat;
    data['currencyFormatSymbolISOCurrency'] = currencyFormatSymbolISOCurrency;
    data['currencyCode'] = currencyCode;
    data['currencySymbol'] = currencySymbol;
    data['currencyValue'] = currencyValue;
    return data;
  }
}

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

class CancelUrl {
  String? href;

  CancelUrl({this.href});

  CancelUrl.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['href'] = href;
    return data;
  }
}

class ShippingMethods {
  String? id;
  bool? selected;
  String? label;
  String? type;
  UnitPrice? amount;

  ShippingMethods({this.id, this.selected, this.label, this.type, this.amount});

  ShippingMethods.fromJson(Map<String, dynamic> json) {
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

class ShippingAddress {
  String? firstName;
  String? lastName;
  String? line1;
  String? line2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  bool? isFullAddress;
  bool? isStoreAddress;

  ShippingAddress(
      {this.firstName,
      this.lastName,
      this.line1,
      this.line2,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.isFullAddress,
      this.isStoreAddress});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
    country = json['country'];
    isFullAddress = json['isFullAddress'];
    isStoreAddress = json['isStoreAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['line1'] = line1;
    data['line2'] = line2;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    data['country'] = country;
    data['isFullAddress'] = isFullAddress;
    data['isStoreAddress'] = isStoreAddress;
    return data;
  }
}

class VaultData {
  String? approvalSessionID;
  String? approvalTokenID;

  VaultData({this.approvalSessionID, this.approvalTokenID});

  VaultData.fromJson(Map<String, dynamic> json) {
    approvalSessionID = json['approvalSessionID'];
    approvalTokenID = json['approvalTokenID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['approvalSessionID'] = approvalSessionID;
    data['approvalTokenID'] = approvalTokenID;
    return data;
  }
}
