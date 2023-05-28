package com.piccmaq.flutter_paypal_native.models.approvaldata;

import androidx.annotation.Nullable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.checkout.createorder.ShippingType;
import com.paypal.checkout.order.Options;
import com.paypal.pyplcheckout.data.model.pojo.Item;
import com.paypal.pyplcheckout.data.model.pojo.ShippingMethodType;
import com.paypal.pyplcheckout.data.model.pojo.ShippingMethods;

import java.util.ArrayList;
import java.util.List;


public class PPShippingMethod {

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
    private PPAmount amount;

    public static ArrayList<PPShippingMethod> fromPayPalObjectList(List<ShippingMethods> items) {
        ArrayList<PPShippingMethod> myList = new ArrayList<>();
        for (ShippingMethods i : items){
            myList.add(PPShippingMethod.fromPayPalObject(i));
        }
        return myList;
    }
    //generate a ShippingOption from mother Options
    public static PPShippingMethod fromPayPalObject(ShippingMethods opt) {
        PPShippingMethod app = new PPShippingMethod();
        app.setId( opt.getId());
        app.setLabel( opt.getLabel());
        app.setSelected( opt.getSelected());
        if (opt.getAmount() != null) {
            app.setAmount(PPAmount.fromPayPalObject(opt.getAmount()));
        }
        ShippingMethodType.Type type = opt.getType();

        if (opt.getAmount() != null) {
            app.setAmount(PPAmount.fromPayPalObject(opt.getAmount()));
        }
        if(type==ShippingMethodType.Type.SHIPPING){
            app.setType("SHIPPING");
        }else if(type==ShippingMethodType.Type.PICKUP){
            app.setType("PICKUP");
        }else if(type==ShippingMethodType.Type.SHIPPING_AND_PICKUP){
            app.setType("SHIPPING_AND_PICKUP");
        }else if(type==ShippingMethodType.Type.NONE){
            app.setType("NONE");
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

    public PPAmount getAmount() {
        return amount;
    }

    public void setAmount(PPAmount amount) {
        this.amount = amount;
    }

}