
package com.piccmaq.flutter_paypal_native.models.approvaldata;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.pyplcheckout.data.model.pojo.Buyer;
import com.paypal.pyplcheckout.data.model.pojo.Name;

public class PPName {

    @SerializedName("fullName")
    @Expose
    private String fullName;
    @SerializedName("givenName")
    @Expose
    private String givenName;
    @SerializedName("familyName")
    @Expose
    private String familyName;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }
    public static PPName fromPayPalObject(Buyer buyer){
        PPName n=new PPName();
        Name nm=buyer.getName();
        if(nm==null){
            return n;
        }
        n.setFamilyName(nm.getFamilyName());
        n.setFullName(nm.getFullName());
        n.setGivenName(nm.getGivenName());

        return n;
    }
}