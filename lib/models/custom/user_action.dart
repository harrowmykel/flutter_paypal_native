enum FPayPalUserAction {
  ///
  /// After you redirect the buyer to the PayPal payment page, a Continue button appears.
  ///
  /// Use this option when the final amount is not known when the checkout flow is initiated and you
  /// want to redirect the buyer to the merchant page without processing the payment.
  ///
  /// This will hide the total price on the PayPal pay sheet.
  ////
  continuePayment,

  ///
  /// After you redirect the buyer to the PayPal payment page, a Pay Now button appears.
  ///
  /// Use this option when the final amount is known when the checkout is initiated and you want to
  /// process the payment immediately when the buyer clicks Pay Now.
  ///
  /// This will display the total price on the PayPal pay sheet.
  ////
  payNow
}

class FPayPalUserActionHelper {
  static const Map<FPayPalUserAction, String> codes = {
    FPayPalUserAction.continuePayment: "continuePayment",
    FPayPalUserAction.payNow: "payNow"
  };

  //convert enum to string
  static String convertFromEnumToString(FPayPalUserAction envv) {
    if (codes[envv] != null) {
      return codes[envv]!;
    }
    return codes[FPayPalUserAction.continuePayment]!;
  }
}
