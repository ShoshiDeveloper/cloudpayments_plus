package com.example.cloudpayments_plus

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import ru.cloudpayments.sdk.card.Card
import java.lang.Exception

class CloudpaymentsPlusPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "cloudpayments_plus")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "createCryptogram") {
      val params = call.arguments as Map<String, String>

      try {
        val cryptogram = Card.createCardCryptogram(params["cardNumber"]!!, params["cardDate"]!!, params["cardCvc"]!!, params["publicId"]!!, params["publicKey"]!!);
        if(cryptogram == null) return result.error("400", "Error from android", "Some param is invalid");
        result.success(cryptogram);

      } catch (e: Exception) {
        return result.error("400", e.toString(), e)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
