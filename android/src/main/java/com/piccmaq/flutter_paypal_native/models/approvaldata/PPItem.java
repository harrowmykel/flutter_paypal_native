package com.piccmaq.flutter_paypal_native.models.approvaldata;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.pyplcheckout.data.model.pojo.Item;

import java.util.ArrayList;
import java.util.List;


public class PPItem {

    @SerializedName("description")
    @Expose
    private String description;
    @SerializedName("name")
    @Expose
    private String name;
    @SerializedName("unitPrice")
    @Expose
    private PPAmount unitPrice;
    @SerializedName("quantity")
    @Expose
    private Integer quantity;
    @SerializedName("total")
    @Expose
    private PPAmount total;
    @SerializedName("details")
    @Expose
    private String details;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public PPAmount getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(PPAmount unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public PPAmount getTotal() {
        return total;
    }

    public void setTotal(PPAmount total) {
        this.total = total;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public static PPItem fromPayPalObject(Item item) {
        PPItem app = new PPItem();
        app.setName(item.getName());
        app.setDescription(item.getDescription());
        app.setQuantity(item.getQuantity());
        if (item.getTotal() != null) {
            app.setTotal(PPAmount.fromPayPalObject(item.getTotal()));
        }
        if (item.getUnitPrice() != null) {
            app.setUnitPrice(PPAmount.fromPayPalObject(item.getUnitPrice()));
        }
        return app;
    }
    public static ArrayList<PPItem> fromPayPalObjectList(List<Item> items) {
        ArrayList<PPItem> myList = new ArrayList<>();
        for (Item i : items){
            myList.add(PPItem.fromPayPalObject(i));
        }
        return myList;
    }
}