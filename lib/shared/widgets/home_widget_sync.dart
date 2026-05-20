import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/platform/home_widget_updater.dart';
import '../../core/utils/currency_formatter.dart';
import '../../features/dashboard/presentation/finance_summary.dart';
import '../../features/profile/presentation/profile_providers.dart';
import '../../features/transactions/presentation/transaction_providers.dart';

class HomeWidgetSync extends ConsumerWidget {
  const HomeWidgetSync({super.key, required this.child});

  final Widget child;

  static String? _lastSignature;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(financeSummaryProvider);
    final transactions = ref.watch(transactionControllerProvider);
    final formatter = MoneyFormatter(ref.watch(currencyProvider));
    final payload = HomeWidgetPayload(
      balance: formatter.format(summary.balance),
      monthIncome: formatter.format(summary.monthIncome),
      monthExpense: formatter.format(summary.monthExpense),
      transactionCount: transactions.length,
    );
    final signature =
        '${payload.balance}|${payload.monthIncome}|${payload.monthExpense}|${payload.transactionCount}';

    if (_lastSignature != signature) {
      _lastSignature = signature;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        HomeWidgetUpdater.update(payload);
      });
    }

    return child;
  }
}
