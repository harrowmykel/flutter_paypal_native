enum FPayPalEnvironment {
  /// Live environment is used for production.
  live,

  /// Sandbox environment is used for development and testing.
  sandbox,

  /// Stage Environment.
  stage,

  /// Local environment is used for local or mock web server testing.
  local;
}

class FPayPalEnvironmentHelper {
  static const Map<FPayPalEnvironment, String> codes = {
    FPayPalEnvironment.live: "live",
    FPayPalEnvironment.sandbox: "sandbox",
    FPayPalEnvironment.stage: "stage",
    FPayPalEnvironment.local: "local",
  };

  //convert enum  to string
  static String convertFromEnumToString(FPayPalEnvironment payPalEnvironment) {
    if (codes[payPalEnvironment] != null) {
      return codes[payPalEnvironment]!;
    }
    return codes[FPayPalEnvironment.sandbox]!;
  }
}
