package com.piccmaq.flutter_paypal_native.models;

import android.util.Log;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.paypal.checkout.approve.Approval;
import com.paypal.checkout.error.ErrorInfo;
import com.paypal.checkout.shipping.ShippingChangeActions;
import com.paypal.checkout.shipping.ShippingChangeData;
import com.piccmaq.flutter_paypal_native.FlutterPaypalNativePlugin;
import com.piccmaq.flutter_paypal_native.models.shippingdata.ShippingChangeDataHelper;

import org.json.JSONException;

import java.util.HashMap;

public class PayPalCallBackHelper {
    FlutterPaypalNativePlugin flutterPaypalPlugin;

    public PayPalCallBackHelper(FlutterPaypalNativePlugin flutterPaypalPlugin) {
        this.flutterPaypalPlugin = flutterPaypalPlugin;
    }

    public void onPayPalApprove(Approval approval) {

        HashMap<String, Object> data = new HashMap<>();

        Gson gson = (new GsonBuilder()).create();
        String json = gson.toJson(approval.getData());
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

        ShippingChangeDataHelper s = ShippingChangeDataHelper
                .prepareFromShippingChangeData(shippingChangeData);
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

//        HashMap<String, String> correlationIds = (HashMap<String, String>) errorInfo.getCorrelationIds();
//        data.put("eligibilityDebugID", correlationIds.getEligibilityDebugID());
//        data.put("fundingEligibilityDebugID", correlationIds.getFundingEligibilityDebugID());
//        data.put("updateClientConfigDebugID", correlationIds.getUpdateClientConfigDebugID());
//        data.put("lsatUpgradeDebugID", correlationIds.getLsatUpgradeDebugID());
//        data.put("fetchPayloadDebugID", correlationIds.getFetchPayloadDebugID());
//        data.put("currencyConversionDebugID", correlationIds.getCurrencyConversionDebugID());
//        data.put("finishCheckoutDebugID", correlationIds.getFinishCheckoutDebugID());

        flutterPaypalPlugin.invokeMethodOnUiThread("FlutterPaypal#onError", data);
    }
}
