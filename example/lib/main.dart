import 'package:cloudpayments_plus/models/card.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:cloudpayments_plus/cloudpayments_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cloudpaymentsPlusPlugin = CloudpaymentsPlus();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final crypto = await cloudpaymentsPlusPlugin.createCryptogram(card: BankCard(cardNumber: '12412', cardCvc: '111', cardDate: '2/23'), publicId: '1', publicKey: '1');
    print(crypto);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: \n'),
        ),
      ),
    );
  }
}
