package com.example.monetra_app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews

class MonetraWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateWidget(context, appWidgetManager, appWidgetId)
        }
    }

    companion object {
        const val PREFS_NAME = "monetra_widget"
        const val KEY_BALANCE = "balance"
        const val KEY_INCOME = "income"
        const val KEY_EXPENSE = "expense"
        const val KEY_COUNT = "transaction_count"

        fun updateWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val balance = prefs.getString(KEY_BALANCE, "COP 0")
            val income = prefs.getString(KEY_INCOME, "COP 0")
            val expense = prefs.getString(KEY_EXPENSE, "COP 0")
            val count = prefs.getInt(KEY_COUNT, 0)

            val views = RemoteViews(context.packageName, R.layout.monetra_widget)
            views.setTextViewText(R.id.widget_balance, balance)
            views.setTextViewText(R.id.widget_income, income)
            views.setTextViewText(R.id.widget_expense, expense)
            views.setTextViewText(
                R.id.widget_count,
                if (count == 1) "1 movimiento" else "$count movimientos"
            )

            val launchIntent = context.packageManager.getLaunchIntentForPackage(context.packageName)
                ?: Intent(context, MainActivity::class.java)
            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                launchIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
