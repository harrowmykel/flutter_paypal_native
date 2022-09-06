package com.piccmaq.flutter_paypal_native.models;

import com.paypal.checkout.config.Environment;
import com.paypal.checkout.createorder.CurrencyCode;
import com.paypal.checkout.createorder.UserAction;

public class CheckoutConfigStore {

   public String clientId ;
    public  Environment payPalEnvironment ;
    public  String returnUrl;
    public CurrencyCode currency ;
    public UserAction userAction ;

    public CheckoutConfigStore(
            String clientId,
            Environment payPalEnvironment,
            String returnUrl,
            CurrencyCode currency,
            UserAction userAction
    ) {
        this.payPalEnvironment = payPalEnvironment;
        this.clientId = clientId;
        this.returnUrl = returnUrl;
        this.currency = currency;
        this.userAction = userAction;
    }


}
