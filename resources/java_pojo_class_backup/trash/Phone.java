package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Phone {

@SerializedName("number")
@Expose
private String number;

public String getNumber() {
return number;
}

public void setNumber(String number) {
this.number = number;
}

}