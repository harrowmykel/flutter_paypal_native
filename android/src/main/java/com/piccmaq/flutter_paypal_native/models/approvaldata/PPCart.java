package com.piccmaq.flutter_paypal_native.models.approvaldata;


import android.util.Log;

import androidx.annotation.Nullable;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.pyplcheckout.data.model.pojo.Cart;


public class PPCart {

    @SerializedName("cartId")
    @Expose
    private String cartId;
    @SerializedName("intent")
    @Expose
    private String intent;
    @SerializedName("total")
    @Expose
    private PPAmount total;
    @SerializedName("shippingAddress")
    @Expose
    private PPCartAddress shippingAddress;
    @SerializedName("billingAddress")
    @Expose
    private PPCartAddress billingAddress;
    @SerializedName("totalAllowedOverCaptureAmount")
    @Expose
    private PPAmount totalAllowedOverCaptureAmount;
    @SerializedName("items")
    @Expose
    private List<PPItem> items = null;
    @SerializedName("shippingMethods")
    @Expose
    private List<PPShippingMethod> shippingMethods = null;


    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public String getIntent() {
        return intent;
    }

    public void setIntent(String intent) {
        this.intent = intent;
    }

    public List<PPItem> getPPItems() {
        return items;
    }

    public void setPPItems(List<PPItem> items) {
        this.items = items;
    }

    public PPAmount getTotal() {
        return total;
    }

    public void setTotal(PPAmount total) {
        this.total = total;
    }

    public List<PPShippingMethod> getShippingMethods() {
        return shippingMethods;
    }

    public void setShippingMethods(List<PPShippingMethod> shippingMethods) {
        this.shippingMethods = shippingMethods;
    }

    public PPCartAddress getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(PPCartAddress cartAddress) {
        this.shippingAddress = cartAddress;
    }

    public PPCartAddress getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(PPCartAddress billingAddress) {
        this.billingAddress = billingAddress;
    }

    public PPAmount getTotalAllowedOverCaptureAmount() {
        return totalAllowedOverCaptureAmount;
    }

    public void setTotalAllowedOverCaptureAmount(PPAmount totalAllowedOverCaptureAmount) {
        this.totalAllowedOverCaptureAmount = totalAllowedOverCaptureAmount;
    }
    public static PPCart fromPayPalObject(@Nullable Cart cart) {
        PPCart app = new PPCart();
        if(cart ==null){
            return app;
        }
        app.setCartId(cart.getCartId());
        app.setIntent(cart.getIntent());
        if (cart.getTotal() != null) {
            app.setTotal(PPAmount.fromPayPalObject(cart.getTotal()));
        }
        if (cart.getShippingAddress() != null) {
            app.setShippingAddress(PPCartAddress.fromPayPalObject(cart.getShippingAddress()));
        }
        if (cart.getBillingAddress() != null) {
            app.setBillingAddress(PPCartAddress.fromPayPalObject(cart.getBillingAddress()));
        }
        if (cart.getItems() != null) {
            app.setPPItems(PPItem.fromPayPalObjectList(cart.getItems()));
        }
        app.setShippingMethods(PPShippingMethod.fromPayPalObjectList(cart.getShippingMethods()));
        return app;
    }

}