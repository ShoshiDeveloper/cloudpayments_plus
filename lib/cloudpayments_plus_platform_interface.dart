import 'package:cloudpayments_plus/models/card.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cloudpayments_plus_method_channel.dart';

abstract class CloudpaymentsPlusPlatform extends PlatformInterface {
  /// Constructs a CloudpaymentsPlusPlatform.
  CloudpaymentsPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static CloudpaymentsPlusPlatform _instance = MethodChannelCloudpaymentsPlus();

  /// The default instance of [CloudpaymentsPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelCloudpaymentsPlus].
  static CloudpaymentsPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CloudpaymentsPlusPlatform] when
  /// they register themselves.
  static set instance(CloudpaymentsPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> createCryptogram(BankCard card, String publicId, String publicKey);
}
