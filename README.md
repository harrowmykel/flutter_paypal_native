# Native Paypal integration with Flutter

[![pub package](https://img.shields.io/pub/v/flutter_paypal_native.svg)](https://pub.dev/packages/flutter_paypal_native)

A Flutter plugin that provides a method for PayPal payment natively  (No Webview).

Now supports Android and iOS 🌟⚡. :)


|             | Android | iOS |
| ----------- | ------- | --- |
| **Support** | SDK 21+ | all |



<img src="https://github.com/harrowmykel/flutter_paypal_native/raw/main/resources/media/flutter_paypal.gif?raw=true" alt="Screenshot" height="400" />

<img src="https://github.com/harrowmykel/flutter_paypal_native/raw/main/resources/media/flutter_paypal_ios.gif?raw=true" alt="Screenshot iOS" height="400" />

## Usage
Add `flutter_paypal_native` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels). If you are targeting Android, make sure to read the *Android Platform Views* section [very important].

## Android Platform Views
Paypal requires that you make changes to your AndroidManifest.xml

#### Prepare your app

Define the android.permission.INTERNET permission in the `AndroidManifest.xml` file of your application as follows:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

      <uses-permission android:name="android.permission.INTERNET" />
      ...

</manifest>
```

add this to your `android/app/build.config`

```groovy
android {
    ...

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    defaultConfig {
        // You must have a minSdkVersion of API 21 
        //(Android 5.0 Lollipop) or later.

        minSdkVersion 21
        ...
    }
}

```
#### Enable the SDK
- Select your app from the My Apps & Credentials page on the Developer Dashboard.
- Enter a Return URL.
You can use an Android App Link registered within the Developer Console to handle SDK redirects.
Alternatively, you can use your application ID (typically referenced via BuildConfig.APPLICATION_ID) and register your application ID with `://paypalpay` as the suffix. For example, if your application ID is `com.paypal.app,` input `com.paypal.app://paypalpay` in the Developer Console.

- The return URL in the Developer Dashboard and the SDK must match exactly.
  Note: If you change the return URL in the Developer Dashboard, PayPal must review your app again. The review period automatically begins any time the return URL changes.

- Select the Log in with PayPal checkbox and the Full name and Email checkboxes found within the Advanced options. These are scopes of the Identity API.
- The version of the Cardinal Consumer Authentication library used in the PayPal SDK does not support AndroidX natively. To prevent runtime crashes when a buyer needs to be verified through 3D Secure, you should add android.`enableJetifier=true` to your `android/gradle.properties` file.

#### Application ID
Note: If your application ID contains underscores [ _ ] then you need to modify the returnUrl so that it forms a valid URI. For details, read this section or [Customize return URL](https://developer.paypal.com/limited-release/paypal-mobile-checkout/android/customize-return-url/).

A return URL redirects users back to the originating page during a checkout flow. For most integrations, using your application ID and `://paypalpay` is the simplest and best `returnUrl` to use as part of the CheckoutConfig. However, there are circumstances when you may need more control over the returnUrl, such as when your application ID has underscores.

##### Choose your custom return URL
Your custom return URL:

- Can only use lowercase letters.
- Can't contain any special characters.
- Must end with `://paypalpay`.
- Must match the return URL on your developer dashboard.
To allow for seamless app switches, make your custom return URL unique. We recommend using reverse domain name notation.

If you're creating a custom return URL because your application ID contains underscores, replace the underscores with periods. For example, change `com.paypal.example_payment_application` to `com.paypal.example.payment.application` .

Enable your app to respond to your custom redirect URL by registering new activities using the `<activity>` tag in the android manifest file.

```xml
<activity
    android:name="com.paypal.openid.RedirectUriReceiverActivity"
    android:excludeFromRecents="true"
    android:theme="@style/PYPLAppTheme">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data
            android:host="paypalpay"
            android:scheme="YOUR-CUSTOM-SCHEME" />
    </intent-filter>
</activity>
<activity
    android:name="com.paypal.pyplcheckout.home.view.activities.PYPLInitiateCheckoutActivity"
    android:theme="@style/AppFullScreenTheme">
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data
            android:host="paypalxo"
            android:scheme="YOUR-CUSTOM-SCHEME" />
    </intent-filter>
</activity>
```

Modify the code
- Copy the sample PayPal Mobile Checkout SDK code and paste it into the code for your mobile checkout page.
For both activities, replace `YOUR-CUSTOM-SCHEME` with the custom return URL that you chose in Step 1. In the example above, instead of `com.paypal.example_payment_application`, you'd use `com.paypal.example.paypal.application`.

- Your app can now respond to authentication and web checkout deep links.


### How to use the library

- Check out the example in `/example/lib/main.dart`

```dart
 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_native/flutter_paypal.dart';
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
  final _flutterPaypalPlugin = FlutterPaypal.instance;
  // log queue
  List<String> logQueue = [];

  @override
  void initState() {
    super.initState();

    initPayPal();
  }

  void initPayPal() async {
    //set debugMode for error logging
    FlutterPaypal.isDebugMode = true;

    //initiate payPal plugin
    await _flutterPaypalPlugin.init(
      //your app id !!! No Underscore!!! see readme.md for help
      returnUrl:
          "com.piccmaq.flutter.paypal.flutter.paypal.example://paypalpay",
       //client id from developer dashboard
      clientID: "AZzDS9l0jS.....",
      //sandbox, staging, live etc
      payPalEnvironment: FPayPalEnvironment.sandbox,
      //what currency do you plan to use? default is US dollars
      currencyCode: FPayPalCurrencyCode.usd,
      //action paynow?
      action: FPayPalUserAction.payNow,
    );

    //call backs for payment
    _flutterPaypalPlugin.setPayPalOrderCallback(
      callback: FPayPalOrderCallback(
        onCancel: () {
        //user canceled the payment
          showResult("cancel");
        },
        onSuccess: (data) {
          //successfully paid
          //remove all items from queue
          _flutterPaypalPlugin.removeAllPurchaseItems();
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
                    _flutterPaypalPlugin.addPurchaseUnit(
                      FPayPalPurchaseUnit(
                        // random prices
                        amount: Random().nextDouble() * 100,

                        ///please use your own algorithm for referenceId. Maybe ProductID?
                        referenceId: FPayPalStrHelper.getRandomString(16),
                      ),
                    );
                  }

                  // initPayPal();
                  _flutterPaypalPlugin.makeOrder(
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


```




#### Troubleshooting Tips
if you have trouble using this library, read these:

- Make sure your applicationId is registered in the developer dashboard as `applicationID://paypalpay` e.g `com.piccmaq.flutter.paypal.flutter.paypal.example://paypalpay` . after registering it, you may have to wait 3 hours for paypal to review it. You may also have to register your privacy url too.

- underscore is not allowed e.g `com.piccmaq.flutter.paypal.flutter_paypal_example://paypalpay` is not allowed, only `com.piccmaq.flutter.paypal.flutter.paypal.example://paypalpay`

- if you have a problem with the `android:label` after using the package, add these to the application tag of your `Androidmanifest.xml`

```xml

   <application
        tools:replace="android:label" 
        xmlns:tools="http://schemas.android.com/tools"
```
.
- The following should be activated in the developer console of Paypal for your account


* Login with paypal
* native checkout sdk
* Email and Fullname
* Vault
* Fullname & email

![Screenshot](https://github.com/harrowmykel/flutter_paypal_native/raw/main/resources/media/screenshots/screenshot_2.png?raw=true "Screenshot")
![Screenshot](https://github.com/harrowmykel/flutter_paypal_native/raw/main/resources/media/screenshots/screenshot_1.png?raw=true "Screenshot")
![Screenshot](https://github.com/harrowmykel/flutter_paypal_native/raw/main/resources/media/screenshots/screenshot_3.png?raw=true "Screenshot")
