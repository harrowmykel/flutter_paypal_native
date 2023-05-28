class UnitAmount {
  String? currencyCode;
  String? currencyValue;

  UnitAmount({
    this.currencyCode,
    this.currencyValue,
  });

  UnitAmount.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currencyCode'];
    currencyValue = json['currencyValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['currencyCode'] = currencyCode;
    data['currencyValue'] = currencyValue;
    return data;
  }
}
