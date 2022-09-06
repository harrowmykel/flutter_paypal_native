
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Item {

@SerializedName("description")
@Expose
private String description;
@SerializedName("name")
@Expose
private String name;
@SerializedName("unitPrice")
@Expose
private Amount unitPrice;
@SerializedName("quantity")
@Expose
private Integer quantity;
@SerializedName("total")
@Expose
private Amount total;
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

public Amount getUnitPrice() {
return unitPrice;
}

public void setUnitPrice(Amount unitPrice) {
this.unitPrice = unitPrice;
}

public Integer getQuantity() {
return quantity;
}

public void setQuantity(Integer quantity) {
this.quantity = quantity;
}

public Amount getTotal() {
return total;
}

public void setTotal(Amount total) {
this.total = total;
}

public String getDetails() {
return details;
}

public void setDetails(String details) {
this.details = details;
}

}