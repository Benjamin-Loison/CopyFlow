package com.example.copyflow

import io.flutter.plugin.common.EventChannel

object ClipboardEventBridge : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    fun emit(text: String) {
        eventSink?.success(text)
    }

    override fun onListen(arguments: Any?, sink: EventChannel.EventSink?) {
        eventSink = sink
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }
}