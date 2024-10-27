# CloudpaymentsPlus

This is a package that allows you to use the cloudpayments sdk in Flutter.

**Important! The package is under development. Currently, only the android platform with incomplete functionality is available**

## Start steps
1. Add ```maven { url 'https://jitpack.io' }``` in your android/build.gradle, in allprojects/repositories
2. Check you min sdk in android/app/build.gradle. It will be is 24.
3. Use package from CloudpaymentsPlus 

## Functional
### Create cryptogram

To create a cryptogram, you just need to write the following code.
```dart
    final cloudpaymentsPlusPlugin = CloudpaymentsPlus();
    final card = BankCard(cardNumber: '9643834269787095', cardCvc: '110', cardDate: '02/2028');

    final cryptogram = await cloudpaymentsPlusPlugin.createCryptogram(card: card, publicId: 'your publicId', publicKey: 'your publicKey');
```