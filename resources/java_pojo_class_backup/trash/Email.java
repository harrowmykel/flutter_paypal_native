
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Email {

@SerializedName("Value")
@Expose
private String value;
@SerializedName("additionalProperties")
@Expose
private String additionalProperties;

public String getValue() {
return value;
}

public void setValue(String value) {
this.value = value;
}

public String getAdditionalProperties() {
return additionalProperties;
}

public void setAdditionalProperties(String additionalProperties) {
this.additionalProperties = additionalProperties;
}

}