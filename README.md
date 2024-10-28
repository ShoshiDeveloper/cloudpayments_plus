# CloudpaymentsPlus

This is a package that allows you to use the cloudpayments sdk in Flutter.

**Important! The package is under development. Currently, only the android platform with incomplete functionality is available**

## Start steps
1. Add ```maven { url 'https://jitpack.io' }``` in your android/build.gradle, in allprojects/repositories
2. Check you min sdk in android/app/build.gradle. It will be is 24.
3. Use package from CloudpaymentsPlus 

If you have version errors, then do the following:

4. Check your Gradle version in android/build.gradle under buildscript/dependencies for com.android.tools.build:gradle:VERSION.
If the VERSION is below 8.1.0
   1. Change it to 8.1.0.
   2. Open android/gradle/wrapper/gradle.properties and change distributionUrl=gradle-VERSION-bin/all.zip to distributionUrl=gradle-8.0-bin.zip (or a newer version).

## Supports
### Create cryptogram

To create a cryptogram, you just need to write the following code.
```dart
    final cloudpaymentsPlusPlugin = CloudpaymentsPlus();
    final card = BankCard(cardNumber: '9643834269787095', cardCvc: '110', cardDate: '02/2028');

    final cryptogram = await cloudpaymentsPlusPlugin.createCryptogram(card: card, publicId: 'your publicId', publicKey: 'your publicKey');
```
