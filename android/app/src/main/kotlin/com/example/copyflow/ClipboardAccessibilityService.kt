package com.example.copyflow

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.AccessibilityServiceInfo
import android.view.accessibility.AccessibilityEvent

class ClipboardAccessibilityService : AccessibilityService() {

    private var lastSeenClip: String? = null

    override fun onServiceConnected() {
        super.onServiceConnected()
        DebugLogBridge.log("onServiceConnected fired")

        val info = AccessibilityServiceInfo().apply {
            eventTypes = AccessibilityEvent.TYPE_VIEW_CLICKED or
                         AccessibilityEvent.TYPE_VIEW_TEXT_SELECTION_CHANGED or
                         AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
            feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC
            notificationTimeout = 150
        }
        serviceInfo = info
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        event ?: return
        android.os.Handler(mainLooper).postDelayed({
            OverlayClipboardReader.readClipboard(applicationContext) { text ->
                if (text != null && text.isNotBlank() && text != lastSeenClip) {
                    DebugLogBridge.log("New clip captured: $text")
                    lastSeenClip = text
                    ClipboardEventBridge.emit(text)
                }
            }
        }, 200)
    }

    override fun onInterrupt() {}
    override fun onDestroy() {
        super.onDestroy()
    }
}