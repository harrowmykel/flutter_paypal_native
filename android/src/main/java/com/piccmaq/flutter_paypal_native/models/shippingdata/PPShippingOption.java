
package com.piccmaq.flutter_paypal_native.models.shippingdata;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.checkout.createorder.ShippingType;
import com.paypal.checkout.order.Options;
import com.piccmaq.flutter_paypal_native.models.approvaldata.PPAmount;

import java.util.ArrayList;
import java.util.List;


public class PPShippingOption {

    @SerializedName("id")
    @Expose
    private String id;
    @SerializedName("selected")
    @Expose
    private Boolean selected;
    @SerializedName("label")
    @Expose
    private String label;
    @SerializedName("type")
    @Expose
    private String type;
    @SerializedName("amount")
    @Expose
    private PSUnitAmount amount;


    public static ArrayList<PPShippingOption> fromPayPalObjectList(List<Options> items) {
        ArrayList<PPShippingOption> myList = new ArrayList<>();
        for (Options i : items){
            myList.add(PPShippingOption.fromPayPalObject(i));
        }
        return myList;
    }
    //generate a ShippingOption from mother Options
    public static PPShippingOption fromPayPalObject(Options opt) {
        PPShippingOption app = new PPShippingOption();
        app.setId( opt.getId());
        app.setLabel( opt.getLabel());
        app.setSelected( opt.getSelected());
        if (opt.getAmount() != null) {
            app.setAmount(PSUnitAmount.fromPayPalObject(opt.getAmount()));
        }

        ShippingType type = opt.getType();
        if(type==ShippingType.SHIPPING){
            app.setType("SHIPPING");
        }else if(type==ShippingType.PICKUP){
            app.setType("PICKUP");
        }
        return app;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Boolean getSelected() {
        return selected;
    }

    public void setSelected(Boolean selected) {
        this.selected = selected;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public PSUnitAmount getAmount() {
        return amount;
    }

    public void setAmount(PSUnitAmount amount) {
        this.amount = amount;
    }

}