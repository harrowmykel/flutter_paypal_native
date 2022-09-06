package com.piccmaq.flutter_paypal_native.models;

import android.util.Log;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.piccmaq.flutter_paypal_native.FlutterRegistrarResponder;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PurchaseUnitHelper {

    public PurchaseUnitHelper() {

    }

    public List<PurchaseUnitC> convertJsonToArrayList(String jsonString) {
        List<PurchaseUnitC> purchaseUnits = new ArrayList<>();
        try {
            Gson gson = new Gson();
            Type listType = new TypeToken<ArrayList<PurchaseUnitC>>() {}.getType();
            ArrayList<PurchaseUnitC> purchaseUnits2 = gson.fromJson(jsonString, listType);
//            PurchaseUnitC[] purchaseUnits2 =
//                    gson.fromJson(
//                            jsonString,
//                            PurchaseUnitC[].class
//                    );
            for (PurchaseUnitC dd : purchaseUnits2) {
                purchaseUnits.add(dd);
            }

        } catch (Exception e) {
            Log.e(FlutterRegistrarResponder.LOG_TAG, e.getMessage());
        }
        return purchaseUnits;
    }
}
