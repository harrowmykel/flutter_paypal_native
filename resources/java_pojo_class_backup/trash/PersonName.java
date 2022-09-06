
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class PersonName {

@SerializedName("fullName")
@Expose
private String fullName;
@SerializedName("givenName")
@Expose
private String givenName;
@SerializedName("familyName")
@Expose
private String familyName;
@SerializedName("additionalProperties")
@Expose
private String additionalProperties;

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

public String getAdditionalProperties() {
return additionalProperties;
}

public void setAdditionalProperties(String additionalProperties) {
this.additionalProperties = additionalProperties;
}

}