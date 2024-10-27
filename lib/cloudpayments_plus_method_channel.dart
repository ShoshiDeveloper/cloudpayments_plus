import 'package:cloudpayments_plus/models/card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cloudpayments_plus_platform_interface.dart';

/// An implementation of [CloudpaymentsPlusPlatform] that uses method channels.
class MethodChannelCloudpaymentsPlus extends CloudpaymentsPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cloudpayments_plus');

  @override
  Future<String?> createCryptogram(BankCard card, String publicId, String publicKey) async {
    final cryptogram = await methodChannel.invokeMethod<String?>('createCryptogram', {
      ...card.toJson(),
      'publicId': publicId,
      'publicKey': publicKey,
    });

    return cryptogram;
  }
}
