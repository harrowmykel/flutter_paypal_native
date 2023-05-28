package com.piccmaq.flutter_paypal_native.models.approvaldata;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.pyplcheckout.data.model.pojo.Buyer;
import com.paypal.pyplcheckout.data.model.pojo.Name;

public class PPEmail {

    @SerializedName("value")
    @Expose
    private String value;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public static PPEmail fromPaypalObject(Buyer buyer){
        PPEmail n=new PPEmail();
        if (buyer.getEmail() == null) {
            return n;
        }
        n.setValue(buyer.getEmail().getStringValue());
        return n;
    }
}