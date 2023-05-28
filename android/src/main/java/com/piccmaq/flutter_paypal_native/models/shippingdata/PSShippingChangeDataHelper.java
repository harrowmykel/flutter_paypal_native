package com.piccmaq.flutter_paypal_native.models.shippingdata;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.checkout.shipping.ShippingChangeData;
import com.paypal.checkout.shipping.ShippingChangeType;

import java.util.List;


public class PSShippingChangeDataHelper {

    @SerializedName("shippingChangeType")
    @Expose
    private String shippingChangeType;
    @SerializedName("shippingAddress")
    @Expose
    private PSShippingChangeAddress shippingAddress;
    @SerializedName("shippingOptions")
    @Expose
    private List<PPShippingOption> shippingOptions ;
    @SerializedName("selectedShippingOption")
    @Expose
    private PPShippingOption selectedShippingOption ;

    public static PSShippingChangeDataHelper fromPayPalObject(ShippingChangeData data) {
        PSShippingChangeDataHelper val = new PSShippingChangeDataHelper();

        List<PPShippingOption> options = PPShippingOption
                .fromPayPalObjectList(data.getShippingOptions());
        val.setShippingOptions(options);

        val.setShippingAddress(
                PSShippingChangeAddress.fromPayPalObject(
                        data.getShippingAddress()
                )
        );

        if (data.getSelectedShippingOption() != null) {
            val.setSelectedShippingOption(
                    PPShippingOption.fromPayPalObject(
                            data.getSelectedShippingOption()
                    )
            );
        }

        ShippingChangeType tt = data.getShippingChangeType();
        if (tt == ShippingChangeType.ADDRESS_CHANGE) {
            val.setShippingChangeType("ADDRESS_CHANGE");
        } else if (tt == ShippingChangeType.OPTION_CHANGE) {
            val.setShippingChangeType("OPTION_CHANGE");
        }

        return val;
    }

    public String getShippingChangeType() {
        return shippingChangeType;
    }

    public void setShippingChangeType(String shippingChangeType) {
        this.shippingChangeType = shippingChangeType;
    }

    public PSShippingChangeAddress getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(PSShippingChangeAddress shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public List<PPShippingOption> getShippingOptions() {
        return shippingOptions;
    }

    public void setShippingOptions(List<PPShippingOption> shippingOptions) {
        this.shippingOptions = shippingOptions;
    }

    public PPShippingOption getSelectedShippingOption() {
        return selectedShippingOption;
    }

    public void setSelectedShippingOption(PPShippingOption selectedShippingOption) {
        this.selectedShippingOption = selectedShippingOption;
    }

}
