package com.piccmaq.flutter_paypal_native.models;

import com.paypal.checkout.createorder.CurrencyCode;

import java.util.Map;
import java.util.HashMap;

public class CurrencyCodeHelper {
    Map<String, CurrencyCode> data =new HashMap<String, CurrencyCode>();

    public CurrencyCodeHelper(){
        data.put("AUD", CurrencyCode.AUD);
        data.put("BRL", CurrencyCode.BRL);
        data.put("CAD", CurrencyCode.CAD);
        data.put("CNY", CurrencyCode.CNY);
        data.put("CZK", CurrencyCode.CZK);
        data.put("DKK", CurrencyCode.DKK);
        data.put("EUR", CurrencyCode.EUR);
        data.put("HKD", CurrencyCode.HKD);
        data.put("HUF", CurrencyCode.HUF);
        data.put("INR", CurrencyCode.INR);
        data.put("ILS", CurrencyCode.ILS);
        data.put("JPY", CurrencyCode.JPY);
        data.put("MYR", CurrencyCode.MYR);
        data.put("MXN", CurrencyCode.MXN);
        data.put("TWD", CurrencyCode.TWD);
        data.put("NZD", CurrencyCode.NZD);
        data.put("NOK", CurrencyCode.NOK);
        data.put("PHP", CurrencyCode.PHP);
        data.put("PLN", CurrencyCode.PLN);
        data.put("GBP", CurrencyCode.GBP);
        data.put("RUB", CurrencyCode.RUB);
        data.put("SGD", CurrencyCode.SGD);
        data.put("SEK", CurrencyCode.SEK);
        data.put("CHF", CurrencyCode.CHF);
        data.put("THB", CurrencyCode.THB);
        data.put("USD", CurrencyCode.USD);
    }

    public   CurrencyCode getEnumFromString(String which){
        if(data.containsKey(which)){
            return data.get(which);
        }
        return CurrencyCode.USD;
    }

    //find enum from key
    public String getStringFromEnum(CurrencyCode which){
        String res = "USD";
        for (String key : data.keySet()) {
            if(data.get(key) == which){
                res = key;
                break;
            }
        }
        return res;
    }
}
