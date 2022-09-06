
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class CartAddress {

@SerializedName("firstName")
@Expose
private String firstName;
@SerializedName("lastName")
@Expose
private String lastName;
@SerializedName("line1")
@Expose
private String line1;
@SerializedName("line2")
@Expose
private String line2;
@SerializedName("city")
@Expose
private String city;
@SerializedName("state")
@Expose
private String state;
@SerializedName("postalCode")
@Expose
private String postalCode;
@SerializedName("country")
@Expose
private String country;
@SerializedName("isFullAddress")
@Expose
private Boolean isFullAddress;
@SerializedName("isStoreAddress")
@Expose
private Boolean isStoreAddress;

public String getFirstName() {
return firstName;
}

public void setFirstName(String firstName) {
this.firstName = firstName;
}

public String getLastName() {
return lastName;
}

public void setLastName(String lastName) {
this.lastName = lastName;
}

public String getLine1() {
return line1;
}

public void setLine1(String line1) {
this.line1 = line1;
}

public String getLine2() {
return line2;
}

public void setLine2(String line2) {
this.line2 = line2;
}

public String getCity() {
return city;
}

public void setCity(String city) {
this.city = city;
}

public String getState() {
return state;
}

public void setState(String state) {
this.state = state;
}

public String getPostalCode() {
return postalCode;
}

public void setPostalCode(String postalCode) {
this.postalCode = postalCode;
}

public String getCountry() {
return country;
}

public void setCountry(String country) {
this.country = country;
}

public Boolean getIsFullAddress() {
return isFullAddress;
}

public void setIsFullAddress(Boolean isFullAddress) {
this.isFullAddress = isFullAddress;
}

public Boolean getIsStoreAddress() {
return isStoreAddress;
}

public void setIsStoreAddress(Boolean isStoreAddress) {
this.isStoreAddress = isStoreAddress;
}

}