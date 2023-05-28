package com.piccmaq.flutter_paypal_native.models.shippingdata;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.checkout.shipping.ShippingChangeAddress;

public class PSShippingChangeAddress {

    @SerializedName("adminArea1")
    @Expose
    private String adminArea1;
    @SerializedName("adminArea2")
    @Expose
    private String adminArea2;
    @SerializedName("postalCode")
    @Expose
    private String postalCode;
    @SerializedName("countryCode")
    @Expose
    private String countryCode;

    public String getAdminArea1() {
        return adminArea1;
    }

    public void setAdminArea1(String adminArea1) {
        this.adminArea1 = adminArea1;
    }

    public String getAdminArea2() {
        return adminArea2;
    }

    public void setAdminArea2(String adminArea2) {
        this.adminArea2 = adminArea2;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public static PSShippingChangeAddress fromPayPalObject(ShippingChangeAddress address){
        PSShippingChangeAddress val = new PSShippingChangeAddress();
        val.setAdminArea1(address.getAdminArea1());
        val.setAdminArea2(address.getAdminArea2());
        val.setCountryCode(address.getCountryCode());
        val.setPostalCode(address.getPostalCode());
        return val;
    }
}