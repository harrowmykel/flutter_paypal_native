class ShippingAddress {
  String? firstName;
  String? lastName;
  String? line1;
  String? line2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  //android only
  bool? isFullAddress;
  //android only
  bool? isStoreAddress;

  ShippingAddress({
    this.firstName,
    this.lastName,
    this.line1,
    this.line2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.isFullAddress,
    this.isStoreAddress,
  });

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
