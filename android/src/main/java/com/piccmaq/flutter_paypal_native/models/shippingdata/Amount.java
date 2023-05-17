package com.piccmaq.flutter_paypal_native.models.shippingdata;

import androidx.annotation.Nullable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.checkout.order.UnitAmount;
import com.piccmaq.flutter_paypal_native.models.CurrencyCodeHelper;


public class Amount {

    @SerializedName("currencyCode")
    @Expose
    private String currencyCode;
    @SerializedName("value")
    @Expose
    private String value;

    @Nullable
    public static Amount fromPaypalUnitAmount(@Nullable UnitAmount amount) {
        if(amount == null){
            return null;
        }
        Amount amt = new Amount();
        CurrencyCodeHelper c = new CurrencyCodeHelper();
        amt.setCurrencyCode(c.getStringFromEnum(amount.getCurrencyCode()));
        amt.setValue(amount.getValue());
        return amt;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}