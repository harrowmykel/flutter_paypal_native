package com.piccmaq.flutter_paypal_native.models;

import android.os.Build;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.paypal.checkout.approve.Approval;
import com.paypal.checkout.error.ErrorInfo;
import com.paypal.checkout.shipping.ShippingChangeActions;
import com.paypal.checkout.shipping.ShippingChangeData;
import com.piccmaq.flutter_paypal_native.FlutterPaypalNativePlugin;
import com.piccmaq.flutter_paypal_native.models.approvaldata.PPApprovalData;
import com.piccmaq.flutter_paypal_native.models.shippingdata.PSShippingChangeDataHelper;

import java.util.HashMap;

public class PayPalCallBackHelper {
    FlutterPaypalNativePlugin flutterPaypalPlugin;

    public PayPalCallBackHelper(FlutterPaypalNativePlugin flutterPaypalPlugin) {
        this.flutterPaypalPlugin = flutterPaypalPlugin;
    }

    public void onPayPalApprove(Approval approval) {

        HashMap<String, Object> data = new HashMap<>();

        Gson gson = (new GsonBuilder()).create();
        String json = gson.toJson(PPApprovalData.fromPayPalObject(approval));
        data.put("approvalData", json);

        approval.getOrderActions().capture((onComplete) -> {
            // Order successfully captured

        });
        flutterPaypalPlugin.invokeMethodOnUiThread("FlutterPaypal#onSuccess", data);

    }

    //called when shippinginfo changes
    public void onPayPalShippingChange(
            ShippingChangeData shippingChangeData,
            ShippingChangeActions shippingChangeActions) {

        PSShippingChangeDataHelper s = PSShippingChangeDataHelper
                .fromPayPalObject(shippingChangeData);
        Gson gson = new Gson();
        String json =gson.toJson(s);

        // Optional error callback
        HashMap<String, String> data = new HashMap<>();
        data.put("result", json);
        flutterPaypalPlugin.invokeMethodOnUiThread("FlutterPaypal#onShippingChange", data);
    }

    // Optional callback for when a buyer cancels the paysheet
    public void onPayPalCancel() {
        flutterPaypalPlugin.invokeMethodOnUiThread("FlutterPaypal#onCancel", null);
    }

    // Optional error callback
    public void onPayPalError(ErrorInfo errorInfo) {
        HashMap<String, Object> data = new HashMap<>();
        data.put("reason", errorInfo.getReason());
        data.put("orderId", errorInfo.getOrderId());
        data.put("error", errorInfo.getError().getMessage());
        data.put("nativeSdkVersion", errorInfo.getNativeSdkVersion());

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            errorInfo.getCorrelationIds().forEach((key, value) -> data.put(key, value));
        }

        flutterPaypalPlugin.invokeMethodOnUiThread("FlutterPaypal#onError", data);
    }
}
