package com.piccmaq.flutter_paypal_native;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.HashMap;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public abstract class FlutterRegistrarResponder {
    Context context;/// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    MethodChannel channel;
    BinaryMessenger messenger;

    public static String LOG_TAG ="etailersuite";

    /**
     * MethodChannel class is home to success() method used by Result class
     * It has the @UiThread annotation and must be run on UI thread, otherwise a RuntimeException will be thrown
     * This will communicate success back to Dart
     */
    void replySuccess(final MethodChannel.Result reply, final Object response) {
        runOnMainThread(new Runnable() {
            @Override
            public void run() {
                reply.success(response);
            }
        });
    }

    /**
     * MethodChannel class is home to error() method used by Result class
     * It has the @UiThread annotation and must be run on UI thread, otherwise a RuntimeException will be thrown
     * This will communicate error back to Dart
     */
    void replyError(final MethodChannel.Result reply, final String message, final Object response) {
        final String tag="flutter_paypal";
        runOnMainThread(new Runnable() {
            @Override
            public void run() {
                reply.error(tag, message, response);
            }
        });
    }

    /**
     * MethodChannel class is home to notImplemented() method used by Result class
     * It has the @UiThread annotation and must be run on UI thread, otherwise a RuntimeException will be thrown
     * This will communicate not implemented back to Dart
     */
    void replyNotImplemented(final MethodChannel.Result reply) {
        runOnMainThread(new Runnable() {
            @Override
            public void run() {
                reply.notImplemented();
            }
        });
    }

    private void runOnMainThread(final Runnable runnable) {
        if (Looper.getMainLooper().getThread() == Thread.currentThread())
            runnable.run();
        else {
            Handler handler = new Handler(Looper.getMainLooper());
            handler.post(runnable);
        }
    }

    public void invokeMethodOnUiThread(final String methodName, final HashMap map) {
        final MethodChannel channel = this.channel;
        runOnMainThread(new Runnable() {
            @Override
            public void run() {
                channel.invokeMethod(methodName, map);
            }
        });
    }

    public void log(final String level, final String message){
//        level = error, debug, verbose;
        Log.e(LOG_TAG, message);
    }
}
