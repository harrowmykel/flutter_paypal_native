
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Buyer {

    @SerializedName("userId")
    @Expose
    private String userId;
    @SerializedName("email")
    @Expose
    private Email email;
    @SerializedName("name")
    @Expose
    private PersonName name;
    @SerializedName("addresses")
    @Expose
    private List<Object> addresses = null;
    @SerializedName("phones")
    @Expose
    private List<Phone> phones = null;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Email getEmail() {
        return email;
    }

    public void setEmail(Email email) {
        this.email = email;
    }

    public PersonName getName() {
        return name;
    }

    public void setName(PersonName name) {
        this.name = name;
    }

    public List<Object> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Object> addresses) {
        this.addresses = addresses;
    }

    public List<Phone> getPhones() {
        return phones;
    }

    public void setPhones(List<Phone> phones) {
        this.phones = phones;
    }

}