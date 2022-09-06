
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Amount {

@SerializedName("currencyFormat")
@Expose
private String currencyFormat;
@SerializedName("currencyFormatSymbolISOCurrency")
@Expose
private String currencyFormatSymbolISOCurrency;
@SerializedName("currencyCode")
@Expose
private String currencyCode;
@SerializedName("currencySymbol")
@Expose
private String currencySymbol;
@SerializedName("currencyValue")
@Expose
private String currencyValue;

public String getCurrencyFormat() {
return currencyFormat;
}

public void setCurrencyFormat(String currencyFormat) {
this.currencyFormat = currencyFormat;
}

public String getCurrencyFormatSymbolISOCurrency() {
return currencyFormatSymbolISOCurrency;
}

public void setCurrencyFormatSymbolISOCurrency(String currencyFormatSymbolISOCurrency) {
this.currencyFormatSymbolISOCurrency = currencyFormatSymbolISOCurrency;
}

public String getCurrencyCode() {
return currencyCode;
}

public void setCurrencyCode(String currencyCode) {
this.currencyCode = currencyCode;
}

public String getCurrencySymbol() {
return currencySymbol;
}

public void setCurrencySymbol(String currencySymbol) {
this.currencySymbol = currencySymbol;
}

public String getCurrencyValue() {
return currencyValue;
}

public void setCurrencyValue(String currencyValue) {
this.currencyValue = currencyValue;
}

}