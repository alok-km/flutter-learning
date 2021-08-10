package com.example.payment_demo_app

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private var receivedData: Bundle = Bundle()
    private var receivedDataKey: String = ""
    private var receivedDataValue: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleIntent()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
                "com.example.payment_demo_app").setMethodCallHandler { call, result ->
                if (call.method == "getreceivedData") {
                    handleIntent()
                    result.success(receivedData)
                    receivedData = Bundle()
                }
            }
    }


    private fun handleIntent() {
        // intent is a property of this activity
        // Only process the intent if it's a send intent and it's of type 'text'
        if (intent?.action == "hk.com.hkicl") {
            println("handled 1")
            // intent.getStringExtra(Intent.EXTRA_TEXT)?.let { intentData ->
            // receivedData = intentData
            intent.getExtras()?.let { intentData ->
                receivedData = intentData
                println(receivedData.keySet())
                println("handled 2")
            }
            // receivedDataKey = receivedData.keySet()
        }
    }
}



