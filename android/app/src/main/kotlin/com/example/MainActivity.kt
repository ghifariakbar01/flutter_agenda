package com.example.login

import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.RemoteException

import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;


class MainActivity : FlutterFragmentActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)
    }


    override fun getBackgroundMode(): FlutterActivityLaunchConfigs.BackgroundMode =
        FlutterActivityLaunchConfigs.BackgroundMode.transparent
}
