
package com.piccmaq.flutter_paypal_native.models.approvaldata.trash;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class VaultData {

@SerializedName("approvalSessionID")
@Expose
private String approvalSessionID;
@SerializedName("approvalTokenID")
@Expose
private String approvalTokenID;

public String getApprovalSessionID() {
return approvalSessionID;
}

public void setApprovalSessionID(String approvalSessionID) {
this.approvalSessionID = approvalSessionID;
}

public String getApprovalTokenID() {
return approvalTokenID;
}

public void setApprovalTokenID(String approvalTokenID) {
this.approvalTokenID = approvalTokenID;
}

}