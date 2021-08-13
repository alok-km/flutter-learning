package com.example.payment_demo_app

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private var receivedData: Bundle = Bundle()
    private var receivedUrl: String = ""
    

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleIntent()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
                "com.example.payment_demo_app").setMethodCallHandler { call, result ->
                if (call.method == "getReceivedData") {
                    handleIntent()
                    // result.success(receivedData)
                    result.success(receivedUrl)
                    // receivedData = Bundle()
                    receivedUrl = ""
                }
            }
    }


    private fun handleIntent() {
        // intent is a property of this activity
        if (intent?.action == "hk.com.hkicl") {
            println("handled the incoming intent")
            intent.getExtras()?.let { intentData ->
                receivedData = intentData
                receivedUrl = receivedData["url"].toString()
            }
            println(receivedUrl)
        }
    }
}
