import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_native/flutter_paypal_native.dart';
import 'package:flutter_paypal_native/models/custom/currency_code.dart';
import 'package:flutter_paypal_native/models/custom/environment.dart';
import 'package:flutter_paypal_native/str_helper.dart';
import 'package:flutter_paypal_native/models/custom/purchase_unit.dart';
import 'package:flutter_paypal_native/models/custom/user_action.dart';
import 'package:flutter_paypal_native/models/custom/order_callback.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterPaypalNativePlugin = FlutterPaypalNative.instance;
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
    await _flutterPaypalNativePlugin.init(
      //your app id !!! No Underscore!!! see readme.md for help
      returnUrl: "com.piccmaq.flutter.paypal.native.example://paypalpay",
      //client id from developer dashboard
      clientID: "AZsCX8....",
      //sandbox, staging, live etc
      payPalEnvironment: FPayPalEnvironment.sandbox,
      //what currency do you plan to use? default is US dollars
      currencyCode: FPayPalCurrencyCode.usd,
      //action paynow?
      action: FPayPalUserAction.payNow,
    );

    //call backs for payment
    _flutterPaypalNativePlugin.setPayPalOrderCallback(
      callback: FPayPalOrderCallback(
        onCancel: () {
          //user canceled the payment
          showResult("cancel");
        },
        onSuccess: (data) {
          //successfully paid
          //remove all items from queue
          _flutterPaypalNativePlugin.removeAllPurchaseItems();
          String visitor = data.cart?.shippingAddress?.firstName ?? 'Visitor';
          String address =
              data.cart?.shippingAddress?.line1 ?? 'Unknown Address';
          showResult(
            "Order successful ${data.payerId ?? ""} - ${data.orderId ?? ""} - $visitor -$address",
          );
        },
        onError: (data) {
          //an error occured
          showResult("error: ${data.reason}");
        },
        onShippingChange: (data) {
          //the user updated the shipping address
          showResult(
            "shipping change: ${data.shippingChangeAddress?.adminArea1 ?? ""}",
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
                  //add 1 item to cart. Max is 4!
                  if (_flutterPaypalNativePlugin.canAddMorePurchaseUnit) {
                    _flutterPaypalNativePlugin.addPurchaseUnit(
                      FPayPalPurchaseUnit(
                        // random prices
                        amount: Random().nextDouble() * 100,

                        ///please use your own algorithm for referenceId. Maybe ProductID?
                        referenceId: FPayPalStrHelper.getRandomString(16),
                      ),
                    );
                  }
                  // initPayPal();
                  _flutterPaypalNativePlugin.makeOrder(
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
