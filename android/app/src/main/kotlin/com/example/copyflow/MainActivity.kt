package com.example.copyflow

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.net.Uri
import android.provider.Settings

class MainActivity : FlutterActivity() {
    private val METHOD_CHANNEL = "copyflow/methods"
    private val EVENT_CHANNEL = "copyflow/clipboard_stream"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)
            .setStreamHandler(ClipboardEventBridge)
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "copyflow/debug_stream")
            .setStreamHandler(DebugLogBridge)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "isAccessibilityServiceEnabled" ->
                        result.success(isAccessibilityServiceEnabled(this))
                    "openAccessibilitySettings" -> {
                        val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
                        startActivity(intent)
                        result.success(null)
                    }
                    "hasOverlayPermission" ->
                        result.success(OverlayClipboardReader.hasOverlayPermission(this))
                    "requestOverlayPermission" -> {
                        val intent = Intent(
                            Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                            Uri.parse("package:$packageName")
                        )
                        startActivity(intent)
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }
    private fun isAccessibilityServiceEnabled(context: android.content.Context): Boolean {
        val expectedServiceName = "${context.packageName}/${context.packageName}.ClipboardAccessibilityService"
        val enabledServices = Settings.Secure.getString(
            context.contentResolver,
            Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES
        ) ?: return false

        return enabledServices.split(':').any {
            it.equals(expectedServiceName, ignoreCase = true)
        }
    }
}