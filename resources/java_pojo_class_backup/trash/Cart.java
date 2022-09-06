
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Cart {

@SerializedName("cartId")
@Expose
private String cartId;
@SerializedName("intent")
@Expose
private String intent;
@SerializedName("billingType")
@Expose
private String billingType;
@SerializedName("paymentId")
@Expose
private String paymentId;
@SerializedName("billingToken")
@Expose
private String billingToken;
@SerializedName("items")
@Expose
private List<Item> items = null;
@SerializedName("amounts")
@Expose
private Amounts amounts;
@SerializedName("description")
@Expose
private String description;
@SerializedName("cancelUrl")
@Expose
private CancelUrl cancelUrl;
@SerializedName("returnUrl")
@Expose
private ReturnUrl returnUrl;
@SerializedName("total")
@Expose
private Amount total;
@SerializedName("shippingMethods")
@Expose
private List<Object> shippingMethods = null;
@SerializedName("shippingAddress")
@Expose
private CartAddress shippingAddress;
@SerializedName("billingAddress")
@Expose
private CartAddress billingAddress;
@SerializedName("totalAllowedOverCaptureAmount")
@Expose
private Amount totalAllowedOverCaptureAmount;

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

public String getBillingType() {
return billingType;
}

public void setBillingType(String billingType) {
this.billingType = billingType;
}

public String getPaymentId() {
return paymentId;
}

public void setPaymentId(String paymentId) {
this.paymentId = paymentId;
}

public String getBillingToken() {
return billingToken;
}

public void setBillingToken(String billingToken) {
this.billingToken = billingToken;
}

public List<Item> getItems() {
return items;
}

public void setItems(List<Item> items) {
this.items = items;
}

public Amounts getAmounts() {
return amounts;
}

public void setAmounts(Amounts amounts) {
this.amounts = amounts;
}

public String getDescription() {
return description;
}

public void setDescription(String description) {
this.description = description;
}

public CancelUrl getCancelUrl() {
return cancelUrl;
}

public void setCancelUrl(CancelUrl cancelUrl) {
this.cancelUrl = cancelUrl;
}

public ReturnUrl getReturnUrl() {
return returnUrl;
}

public void setReturnUrl(ReturnUrl returnUrl) {
this.returnUrl = returnUrl;
}

public Amount getTotal() {
return total;
}

public void setTotal(Amount total) {
this.total = total;
}

public List<Object> getShippingMethods() {
return shippingMethods;
}

public void setShippingMethods(List<Object> shippingMethods) {
this.shippingMethods = shippingMethods;
}

public CartAddress getShippingAddress() {
return shippingAddress;
}

public void setShippingAddress(CartAddress cartAddress) {
this.shippingAddress = cartAddress;
}

public CartAddress getBillingAddress() {
return billingAddress;
}

public void setBillingAddress(CartAddress billingAddress) {
this.billingAddress = billingAddress;
}

public Amount getTotalAllowedOverCaptureAmount() {
return totalAllowedOverCaptureAmount;
}

public void setTotalAllowedOverCaptureAmount(Amount totalAllowedOverCaptureAmount) {
this.totalAllowedOverCaptureAmount = totalAllowedOverCaptureAmount;
}

}