import 'package:flutter_paypal_native/models/approval_data.dart';
import 'package:flutter_paypal_native/models/map_helper.dart';

//TODO
class FPayPalShippingOptions extends MapHelper {
  String id = "";
  String selected = "";
  String label = "";
  String type = "";
  List<Amounts> amounts = [];
//   "id":" ",
// "selected":true,
// "label":" ",
// "type": "ShippingType",
// "amount":{
// "currencyCode":"CurrencyCode",
// "value":" "
// }

  FPayPalShippingOptions fromMap(Map<String, dynamic> data) {
    //the data is saved in result key
    MapHelper _c = MapHelper()..setMap(data);
    return this;
  }
}
