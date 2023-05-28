import 'package:flutter_paypal_native/models/approval/amounts.dart';
import 'package:flutter_paypal_native/models/map_helper.dart';

class FPayPalShippingOptions extends MapHelper {
  String? id;
  String? selected;
  String? label;
  String? type;
  List<Amounts> amounts = [];

  FPayPalShippingOptions fromMap(Map<String, dynamic> data) {
    //the data is saved in result key
    setMap(data);
    id = getString('id');
    selected = getString('selected');
    label = getString('label');
    type = getString('type');
    amounts = [];

    List<dynamic>? amounts2 = getList('amounts');
    if (amounts2 != null) {
      for (var element in amounts2) {
        amounts.add(Amounts.fromJson(element));
      }
    }
    return this;
  }
}
