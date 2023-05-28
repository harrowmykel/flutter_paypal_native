package com.piccmaq.flutter_paypal_native.models.approvaldata;

import com.paypal.pyplcheckout.data.model.pojo.Buyer;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class PPPayer {

    @SerializedName("name")
    @Expose
    private PPName name;
    @SerializedName("email")
    @Expose
    private PPEmail email;
    @SerializedName("userId")
    @Expose
    private String userId;
    @SerializedName("imageUrl")
    @Expose
    private String imageUrl;

    public PPName getName() {
        return name;
    }

    public void setName(PPName name) {
        this.name = name;
    }

    public PPEmail getEmail() {
        return email;
    }

    public void setEmail(PPEmail email) {
        this.email = email;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public static PPPayer fromPayPalObject(Buyer buyer) {
        PPPayer app = new PPPayer();
        app.setName(PPName.fromPayPalObject(buyer));
        app.setEmail(PPEmail.fromPaypalObject(buyer));
        app.setUserId(buyer.getUserId());
        return app;
    }
}
