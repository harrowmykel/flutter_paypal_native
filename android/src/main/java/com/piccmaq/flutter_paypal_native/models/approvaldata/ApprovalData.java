package com.piccmaq.flutter_paypal_native.models.approvaldata;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.pyplcheckout.pojo.Buyer;
import com.paypal.pyplcheckout.pojo.Cart;
import com.paypal.pyplcheckout.pojo.VaultData;


public class ApprovalData {

    @SerializedName("payerId")
    @Expose
    private String payerId;
    @SerializedName("orderId")
    @Expose
    private String orderId;
    @SerializedName("paymentId")
    @Expose
    private String paymentId;
    @SerializedName("payer")
    @Expose
    private Buyer payer;
    @SerializedName("cart")
    @Expose
    private Cart cart;
    @SerializedName("vaultData")
    @Expose
    private VaultData vaultData;
    @SerializedName("billingToken")
    @Expose
    private String billingToken;

    public static ApprovalData fromPayPalObject(com.paypal.checkout.approve.ApprovalData approvalData) {
        ApprovalData app = new ApprovalData();
        app.setBillingToken(approvalData.getBillingToken());
        app.setCart(approvalData.getCart());
        app.setVaultData(approvalData.getVaultData());
        app.setOrderId(approvalData.getOrderId());
        app.setPaymentId(approvalData.getPaymentId());
        app.setBuyer(approvalData.getPayer());
        return app;
    }

    public String getBuyerId() {
        return payerId;
    }

    public void setBuyerId(String payerId) {
        this.payerId = payerId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public Buyer getBuyer() {
        return payer;
    }

    public void setBuyer(Buyer payer) {
        this.payer = payer;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public VaultData getVaultData() {
        return vaultData;
    }

    public void setVaultData(VaultData vaultData) {
        this.vaultData = vaultData;
    }

    public String getBillingToken() {
        return billingToken;
    }

    public void setBillingToken(String billingToken) {
        this.billingToken = billingToken;
    }
}