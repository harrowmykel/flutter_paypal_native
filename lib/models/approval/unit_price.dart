class UnitPrice {
  String? currencyFormat;
  String? currencyFormatSymbolISOCurrency;
  String? currencyCode;
  String? currencySymbol;
  String? currencyValue;

  UnitPrice({
    this.currencyFormat,
    this.currencyFormatSymbolISOCurrency,
    this.currencyCode,
    this.currencySymbol,
    this.currencyValue,
  });

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
