package com.piccmaq.flutter_paypal_native.models.shippingdata;

import androidx.annotation.Nullable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.checkout.createorder.ShippingType;
import com.paypal.checkout.order.Options;

import java.util.ArrayList;
import java.util.List;


public class ShippingOption {

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
    private Amount amount;


    //generate an array of ShippingOtion from mother Options List
    public static List<ShippingOption> fromPaypalOptionsList(List<Options> opts) {
        List<ShippingOption> options = new ArrayList<>();
        for (Options opt : opts) {
            options.add(ShippingOption.fromPaypalOptions(opt));
        }
        return options;
    }

    //generate a ShippingOption from mother Options
    @Nullable
    public static ShippingOption fromPaypalOptions(@Nullable  Options opt) {
        if(opt == null){
            return null;
        }
        ShippingOption option = new ShippingOption();
        Amount amt = Amount.fromPaypalUnitAmount(opt.getAmount());
        option.setAmount(amt);
        option.setId(opt.getId());
        option.setLabel(opt.getLabel());
        option.setSelected(opt.getSelected());

        ShippingType type = opt.getType();
        if(type == ShippingType.SHIPPING){
            option.setType("shipping");
        }else  if(type == ShippingType.PICKUP){
            option.setType("pickup");
        }
        return option;
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

    public Amount getAmount() {
        return amount;
    }

    public void setAmount(Amount amount) {
        this.amount = amount;
    }

}