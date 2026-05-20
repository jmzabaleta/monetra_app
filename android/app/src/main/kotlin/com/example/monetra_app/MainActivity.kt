package com.example.monetra_app

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "monetra/home_widget"
        ).setMethodCallHandler { call, result ->
            if (call.method != "updateSummary") {
                result.notImplemented()
                return@setMethodCallHandler
            }

            val balance = call.argument<String>("balance") ?: "COP 0"
            val income = call.argument<String>("monthIncome") ?: "COP 0"
            val expense = call.argument<String>("monthExpense") ?: "COP 0"
            val count = call.argument<Int>("transactionCount") ?: 0

            val prefs = getSharedPreferences(MonetraWidgetProvider.PREFS_NAME, Context.MODE_PRIVATE)
            prefs.edit()
                .putString(MonetraWidgetProvider.KEY_BALANCE, balance)
                .putString(MonetraWidgetProvider.KEY_INCOME, income)
                .putString(MonetraWidgetProvider.KEY_EXPENSE, expense)
                .putInt(MonetraWidgetProvider.KEY_COUNT, count)
                .apply()

            val appWidgetManager = AppWidgetManager.getInstance(this)
            val component = ComponentName(this, MonetraWidgetProvider::class.java)
            val ids = appWidgetManager.getAppWidgetIds(component)
            val updateIntent = Intent(this, MonetraWidgetProvider::class.java).apply {
                action = AppWidgetManager.ACTION_APPWIDGET_UPDATE
                putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, ids)
            }
            sendBroadcast(updateIntent)
            result.success(null)
        }
    }
}
