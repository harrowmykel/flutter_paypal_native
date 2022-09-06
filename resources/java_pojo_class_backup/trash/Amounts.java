package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Amounts {

    @SerializedName("handlingFee")
    @Expose
    private Amount handlingFee;
    @SerializedName("insurance")
    @Expose
    private Amount insurance;
    @SerializedName("shippingAndHandling")
    @Expose
    private Amount shippingAndHandling;
    @SerializedName("shippingDiscount")
    @Expose
    private Amount shippingDiscount;
    @SerializedName("subtotal")
    @Expose
    private Amount subtotal;
    @SerializedName("tax")
    @Expose
    private Amount tax;
    @SerializedName("total")
    @Expose
    private String total;

    public Amount getHandlingFee() {
        return handlingFee;
    }

    public void setHandlingFee(Amount handlingFee) {
        this.handlingFee = handlingFee;
    }

    public Amount getInsurance() {
        return insurance;
    }

    public void setInsurance(Amount insurance) {
        this.insurance = insurance;
    }

    public Amount getShippingAndHandling() {
        return shippingAndHandling;
    }

    public void setShippingAndHandling(Amount shippingAndHandling) {
        this.shippingAndHandling = shippingAndHandling;
    }

    public Amount getShippingDiscount() {
        return shippingDiscount;
    }

    public void setShippingDiscount(Amount shippingDiscount) {
        this.shippingDiscount = shippingDiscount;
    }

    public Amount getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Amount subtotal) {
        this.subtotal = subtotal;
    }

    public Amount getTax() {
        return tax;
    }

    public void setTax(Amount tax) {
        this.tax = tax;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}