import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_native/flutter_paypal_native.dart';
import 'package:flutter_paypal_native/str_helper.dart';
import 'package:flutter_paypal_native/models/environment.dart';
import 'package:flutter_paypal_native/models/currency_code.dart';
import 'package:flutter_paypal_native/models/purchase_unit.dart';
import 'package:flutter_paypal_native/models/user_action.dart';
import 'package:flutter_paypal_native/models/order_callback.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _FlutterPaypalNativePlugin = FlutterPaypalNative.instance;
  // log queue
  List<String> logQueue = [];

  @override
  void initState() {
    super.initState();

    initPayPal();
  }

  void initPayPal() async {
    //set debugMode for error logging
    FlutterPaypalNative.isDebugMode = true;

    //initiate payPal plugin
    await _FlutterPaypalNativePlugin.init(
      //your app id !!! No Underscore!!! see readme.md for help
      returnUrl: "com.piccmaq.flutter.paypal.native.example://paypalpay",
      //client id from developer dashboard
      clientID: "AZsCX8U9TG3Ah....",
      //sandbox, staging, live etc
      payPalEnvironment: FPayPalEnvironment.sandbox,
      //what currency do you plan to use? default is US dollars
      currencyCode: FPayPalCurrencyCode.usd,
      //action paynow?
      action: FPayPalUserAction.payNow,
    );

    //call backs for payment
    _FlutterPaypalNativePlugin.setPayPalOrderCallback(
      callback: FPayPalOrderCallback(
        onCancel: () {
          //user canceled the payment
          showResult("cancel");
        },
        onSuccess: (data) {
          //successfully paid
          //remove all items from queue
          _FlutterPaypalNativePlugin.removeAllPurchaseItems();
          String orderID = data.orderId ?? "";
          showResult("Order successful $orderID");
        },
        onError: (data) {
          //an error occured
          showResult("error: ${data.reason}");
        },
        onShippingChange: (data) {
          //the user updated the shipping address
          showResult(
            "shipping change: ${data.shippingAddress?.addressLine1 ?? ""}",
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              for (String t in logQueue) Text(t),
              ElevatedButton(
                child: const Text("Do payment"),
                onPressed: () {
                  //add 4 items to cart
                  for (var i = 0; i < 4; i++) {
                    _FlutterPaypalNativePlugin.addPurchaseUnit(
                      FPayPalPurchaseUnit(
                        // random prices
                        amount: Random().nextDouble() * 100,

                        ///please use your own algorithm for referenceId. Maybe ProductID?
                        referenceId: FPayPalStrHelper.getRandomString(16),
                      ),
                    );
                  }

                  // initPayPal();
                  _FlutterPaypalNativePlugin.makeOrder(
                    action: FPayPalUserAction.payNow,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// all to log queue
  showResult(String text) {
    logQueue.add(text);
    setState(() {});
  }
}
