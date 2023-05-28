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
