enum FPayPalCurrencyCode {
  /// Currency Code for: Australian dollar

  aud,

  /// Currency Code for: Brazilian real
  ///
  /// Note: This currency is supported as a payment currency and a currency balance for in-country
  /// PayPal accounts only.If the receiver of funds is not from Brazil, then PayPal converts funds
  /// into the primary holding currency of the account with the applicable currency conversion
  /// rate.The currency conversion rate includes PayPal's applicable spread or fee.

  brl,

  /// Currency Code for: Canadian dollar

  cad,

  /// Currency Code for: Chinese Renmenbi
  ///
  /// Note: This currency is supported as a payment currency and a currency balance for in-country
  /// PayPal accounts only.

  cny,

  /// Currency Code for: Czech koruna

  czk,

  /// Currency Code for: Danish krone

  dkk,

  /// Currency Code for: Euro

  eur,

  /// Currency Code for: Hong Kong dollar

  hkd,

  /// Currency Code for: Hungarian forint
  ///
  /// Note: This currency does not support decimals.If you pass a decimal amount, an error occurs.

  huf,

  /// Currency Code for: Indian rupee
  ///
  /// Note: This currency is supported as a payment currency and a currency balance for in-country
  /// PayPal India accounts only.

  inr,

  /// Currency Code for: Israeli new shekel

  ils,

  /// Currency Code for: Japanese yen
  ///
  /// Note: This currency does not support decimals.If you pass a decimal amount, an error occurs.

  jpy,

  /// Currency Code for: Malaysian ringgit
  ///
  /// Note: This currency is supported as a payment currency and a currency balance for in-country
  /// PayPal accounts only.

  myr,

  /// Currency Code for: Mexican peso

  mxn,

  /// Currency Code for: New Taiwan dollar
  ///
  /// Note: This currency does not support decimals.If you pass a decimal amount, an error occurs.

  twd,

  /// Currency Code for: New Zealand dollar

  nzd,

  /// Currency Code for: Norwegian krone

  nok,

  /// Currency Code for: Philippine peso

  php,

  /// Currency Code for: Polish złoty

  pln,

  /// Currency Code for: Pound Sterling

  gbp,

  /// Currency Code for: Russian ruble

  rub,

  /// Currency Code for: Singapore dollar

  sgd,

  /// Currency Code for: Swedish krona

  sek,

  /// Currency Code for: Swiss franc

  chf,

  /// Currency Code for: Thai baht

  thb,

  /// Currency Code for: United States dollar
  usd,
}

class FPayPalCurrencyCodeHelper {
  static const Map<FPayPalCurrencyCode, String> codes = {
    FPayPalCurrencyCode.aud: "AUD",
    FPayPalCurrencyCode.brl: "BRL",
    FPayPalCurrencyCode.cad: "CAD",
    FPayPalCurrencyCode.cny: "CNY",
    FPayPalCurrencyCode.czk: "CZK",
    FPayPalCurrencyCode.dkk: "DKK",
    FPayPalCurrencyCode.eur: "EUR",
    FPayPalCurrencyCode.hkd: "HKD",
    FPayPalCurrencyCode.huf: "HUF",
    FPayPalCurrencyCode.inr: "INR",
    FPayPalCurrencyCode.ils: "ILS",
    FPayPalCurrencyCode.jpy: "JPY",
    FPayPalCurrencyCode.myr: "MYR",
    FPayPalCurrencyCode.mxn: "MXN",
    FPayPalCurrencyCode.twd: "TWD",
    FPayPalCurrencyCode.nzd: "NZD",
    FPayPalCurrencyCode.nok: "NOK",
    FPayPalCurrencyCode.php: "PHP",
    FPayPalCurrencyCode.pln: "PLN",
    FPayPalCurrencyCode.gbp: "GBP",
    FPayPalCurrencyCode.rub: "RUB",
    FPayPalCurrencyCode.sgd: "SGD",
    FPayPalCurrencyCode.sek: "SEK",
    FPayPalCurrencyCode.chf: "CHF",
    FPayPalCurrencyCode.thb: "THB",
    FPayPalCurrencyCode.usd: "USD"
  };

  //convert enum currency to string
  static String convertFromEnumToString(FPayPalCurrencyCode currencyCode) {
    if (codes[currencyCode] != null) {
      return codes[currencyCode]!;
    }
    return codes[FPayPalCurrencyCode.usd]!;
  }
}
