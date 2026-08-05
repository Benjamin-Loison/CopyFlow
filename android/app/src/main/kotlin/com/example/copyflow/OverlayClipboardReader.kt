package com.example.copyflow

import android.content.ClipboardManager
import android.content.Context
import android.graphics.PixelFormat
import android.os.Build
import android.view.Gravity
import android.view.View
import android.view.WindowManager

object OverlayClipboardReader {

    fun readClipboard(context: Context, onResult: (String?) -> Unit) {
        val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        val overlayView = View(context)

        val layoutFlag = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY

        val params = WindowManager.LayoutParams(
            1, 1, // 1x1 pixel — effectively invisible
            layoutFlag,
            WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
            WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.START
        }

        try {
            windowManager.addView(overlayView, params)

            val clipboardManager =
                context.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
            val clipText = clipboardManager.primaryClip
                ?.takeIf { it.itemCount > 0 }
                ?.getItemAt(0)
                ?.coerceToText(context)
                ?.toString()

            onResult(clipText)
        } catch (e: Exception) {
            onResult(null)
        } finally {
            try {
                windowManager.removeView(overlayView)
            } catch (_: Exception) { /* view may not have attached */ }
        }
    }

    fun hasOverlayPermission(context: Context): Boolean {
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.M ||
               android.provider.Settings.canDrawOverlays(context)
    }
}