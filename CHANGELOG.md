## 2.0.1
* changed ios sdk version from 0.109.0 to 1.1.0
* updated minium ios version to 13.0 (required by paypal)

## 2.0.0
* changed android sdk version from 0.122.2 to 1.1.0
* updated example
* updated readme

## 1.0.2
* added null check for Buyer.getName()
* updated readme to indicate max purchase unit count
* added `canAddMorePurchaseUnit` as helper function
* changed android sdk version from 0.122.0 to 0.122.2
* updated example

## 1.0.1
* fixed ios error in shipping change

## 1.0.0
* Lots of breaking changes
* Unified ios and android codebase
* removed paypal internal objects
* fixed missing shipping address data

## 0.0.10
* fixed android issue
  
## 0.0.9
**Features Updates**
* Introduced Pay Later PayPal offerings
* Added the ability for users to add an initial payment method to their PayPal account
* Updated the UI of the native add-card flow to include complete address input
* Added the ability to programmatically logout a PayPal user

**Breaking Changes**
* `Order` was renamed to `OrderRequest`
* `SettingsConfig.shouldFailEligibility` was renamed to `SettingsConfig.showWebCheckout`
* `Address` returned in the `OnShippingChange` callback was renamed to `ShippingChangeAddress`

**Non-Breaking Changes**
* Updated version to 0.112.0 to align with iOS
* Additional bugfixes

**GitHub Issues Resolved**
https://github.com/paypal/android-checkout-sdk/issues/99
https://github.com/paypal/android-checkout-sdk/issues/100
https://github.com/paypal/android-checkout-sdk/issues/104
https://github.com/paypal/android-checkout-sdk/issues/226
https://github.com/paypal/android-checkout-sdk/issues/184
https://github.com/paypal/android-checkout-sdk/issues/216

## 0.0.8
* fixed unable to infer error on ios | thanks to @Rishan99 for fixing and @jpainam for reporting

## 0.0.7
* updated paypal sdk library

## 0.0.6
* fixed android class
  
## 0.0.5
* now supports iOS

## 0.0.4
* added more documentation to readme

## 0.0.3
* added gifs size to readme

## 0.0.2
* added gifs links to readme

## 0.0.1
* TODO: Describe initial release.
