
import 'package:cloudpayments_plus/models/card.dart';

import 'cloudpayments_plus_platform_interface.dart';

class CloudpaymentsPlus {
  Future<String?> createCryptogram({required BankCard card,required  String publicId,required  String publicKey}) => CloudpaymentsPlusPlatform.instance.createCryptogram(card, publicId, publicKey);
}
