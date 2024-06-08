package com.example.test_vnpay

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import vn.zalopay.sdk.Environment
import vn.zalopay.sdk.ZaloPayError
import vn.zalopay.sdk.ZaloPaySDK
import vn.zalopay.sdk.listeners.PayOrderListener

class MainActivity: FlutterActivity() {

    // Define the channel for communication between Flutter and Android native code
    private val channelPayOrder = "com.example.test_vnpay/payOrder"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Initialize ZaloPaySDK with your AppID and environment
        ZaloPaySDK.init(2554, Environment.SANDBOX) // Replace with your actual Merchant AppID
    }

    // Handle new Intent data (e.g., callback from ZaloPay)
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        Log.d("onNewIntent", "Received new Intent: $intent")
        // Handle the result from ZaloPaySDK
        ZaloPaySDK.getInstance().onResult(intent)
    }

    // Configure MethodChannel for communication with Flutter
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelPayOrder).setMethodCallHandler { call, result ->
            if (call.method == "payOrder") {
                val token = call.argument<String>("zptoken")
                if (token != null) {
                    initiatePayment(token, result)
                } else {
                    Log.e("payOrder", "Missing payment token")
                    result.error("INVALID_ARGUMENT", "Missing payment token", null)
                }
            } else {
                Log.e("MethodCall", "Method not implemented: ${call.method}")
                result.notImplemented()
            }
        }
    }

    // Helper function to handle payment initiation
    private fun initiatePayment(token: String, result: MethodChannel.Result) {
        // Define URI scheme, should be customized for your app
        val uriScheme = "yourapp://callback" // Replace with your actual URI scheme

        ZaloPaySDK.getInstance().payOrder(this, token, uriScheme, object : PayOrderListener {
            override fun onPaymentCanceled(zpTransToken: String?, appTransID: String?) {
                Log.d("onPaymentCancel", "Transaction cancelled. [zpTransToken]: $zpTransToken, [appTransID]: $appTransID")
                result.success("User Canceled")
            }

            override fun onPaymentError(zaloPayErrorCode: ZaloPayError?, zpTransToken: String?, appTransID: String?) {
                Log.e("onPaymentError", "Payment failed. [zaloPayErrorCode]: $zaloPayErrorCode, [zpTransToken]: $zpTransToken, [appTransID]: $appTransID")
                // Show error dialog or redirect to the store if necessary
                result.success("Payment failed")
            }

            override fun onPaymentSucceeded(transactionId: String, transToken: String, appTransID: String?) {
                Log.d("onPaymentSucceeded", "Payment successful. [TransactionId]: $transactionId, [TransToken]: $transToken, [appTransID]: $appTransID")
                result.success("Payment Success")
            }
        })
    }
}
