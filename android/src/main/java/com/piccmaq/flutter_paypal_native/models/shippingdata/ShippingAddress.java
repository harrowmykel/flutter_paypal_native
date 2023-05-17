package com.piccmaq.flutter_paypal_native.models.shippingdata;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.checkout.order.Address;

public class ShippingAddress {

    @SerializedName("addressLine1")
    @Expose
    private String addressLine1;
    @SerializedName("addressLine2")
    @Expose
    private String addressLine2;
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

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

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


    public static ShippingAddress fromPaypalShippingAddress(Address address){
        ShippingAddress val = new ShippingAddress();
        val.setAddressLine1(address.getAddressLine1());
        val.setAddressLine2(address.getAddressLine2());
        val.setAdminArea1(address.getAdminArea1());
        val.setAdminArea2(address.getAdminArea2());
        val.setCountryCode(address.getCountryCode());
        val.setPostalCode(address.getPostalCode());
        return val;
    }
}