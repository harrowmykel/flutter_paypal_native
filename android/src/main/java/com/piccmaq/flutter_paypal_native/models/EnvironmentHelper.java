package com.piccmaq.flutter_paypal_native.models;

import com.paypal.checkout.config.Environment;

import java.util.Map;
import java.util.HashMap;

public class EnvironmentHelper {
    Map<String, Environment> data =new HashMap<String, Environment>();

    public  EnvironmentHelper(){
        data.put("sandbox",Environment.SANDBOX);
        data.put("stage",Environment.STAGE);
        data.put("local",Environment.LOCAL);
        data.put("live",Environment.LIVE);
    }

    public Environment getEnumFromString(String which){
        if(data.get(which)!=null){
            return data.get(which);
        }
        return Environment.SANDBOX;
    }

}
