package com.example.copyflow

import io.flutter.plugin.common.EventChannel

object DebugLogBridge : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    fun log(message: String) {
        eventSink?.success(message)
    }

    override fun onListen(arguments: Any?, sink: EventChannel.EventSink?) {
        eventSink = sink
        log("Debug log stream connected")
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }
}