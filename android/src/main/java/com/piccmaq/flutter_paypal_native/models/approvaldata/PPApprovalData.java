package com.piccmaq.flutter_paypal_native.models.approvaldata;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.pyplcheckout.data.model.pojo.Buyer;
import com.paypal.pyplcheckout.data.model.pojo.Cart;


public class PPApprovalData {

    @SerializedName("payerId")
    @Expose
    private String payerId;
    @SerializedName("orderId")
    @Expose
    private String orderId;
    @SerializedName("payer")
    @Expose
    private PPPayer payer;
    @SerializedName("cart")
    @Expose
    private PPCart cart;
    @SerializedName("intent")
    @Expose
    private String intent;

    public static PPApprovalData fromPayPalObject(com.paypal.checkout.approve.Approval approval ) {
        PPApprovalData app = new PPApprovalData();
        com.paypal.checkout.approve.ApprovalData approvalData = approval.getData();
        app.setOrderId(approvalData.getOrderId());
        app.setPayerId(approvalData.getPayerId());
        app.setIntent("PURCHASE");
        app.setPayer(PPPayer.fromPayPalObject(approvalData.getPayer()));
        app.setCart(PPCart.fromPayPalObject(approvalData.getCart()));
        return app;
    }

    public String getPayerId() {
        return payerId;
    }

    public void setPayerId(String payerId) {
        this.payerId = payerId;
    }

    public PPPayer getPayer() {
        return payer;
    }

    public void setPayer(PPPayer payer) {
        this.payer = payer;
    }

    public String getIntent() {
        return intent;
    }

    public void setIntent(String intent) {
        this.intent = intent;
    }
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }



    public PPCart getCart() {
        return cart;
    }

    public void setCart(PPCart cart) {
        this.cart = cart;
    }


}