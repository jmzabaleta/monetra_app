import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/monetra_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../../shared/widgets/transaction_tile.dart';
import '../../profile/presentation/profile_providers.dart';
import '../../transactions/domain/finance_transaction.dart';
import '../../transactions/domain/transaction_type.dart';
import '../../transactions/presentation/transaction_providers.dart';
import 'finance_summary.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(financeSummaryProvider);
    final transactions = ref.watch(transactionControllerProvider);
    final formatter = MoneyFormatter(ref.watch(currencyProvider));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monetra'),
        actions: [
          IconButton(
            tooltip: 'Notificaciones',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _BalanceHero(balance: formatter.format(summary.balance)),
          const SizedBox(height: AppSpacing.md),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
              childAspectRatio: 1.12,
            ),
            children: [
              StatCard(
                title: 'Ingresos',
                value: formatter.format(summary.monthIncome),
                subtitle: 'Este mes',
                icon: Icons.trending_up_rounded,
                color: AppPalette.emerald,
              ),
              StatCard(
                title: 'Gastos',
                value: formatter.format(summary.monthExpense),
                subtitle: 'Este mes',
                icon: Icons.trending_down_rounded,
                color: AppPalette.coral,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _MiniMetric(
                  label: 'Ingresos totales',
                  value: formatter.format(summary.totalIncome),
                  color: AppPalette.emerald,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _MiniMetric(
                  label: 'Gastos totales',
                  value: formatter.format(summary.totalExpense),
                  color: AppPalette.coral,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Flujo mensual'),
          MonetraCard(
            child: SizedBox(
              height: 190,
              child: transactions.isEmpty
                  ? const EmptyState(
                      icon: Icons.show_chart_rounded,
                      title: 'Listo para empezar',
                      message:
                          'Registra tus primeros movimientos y el flujo mensual aparecera aqui.',
                    )
                  : LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        titlesData: const FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            color: AppPalette.emerald,
                            barWidth: 4,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: AppPalette.emerald.withValues(alpha: .13),
                            ),
                            spots: _monthlyFlowSpots(transactions),
                          ),
                        ],
                      ),
                      duration: const Duration(milliseconds: 700),
                    ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Ultimas transacciones'),
          MonetraCard(
            child: transactions.isEmpty
                ? const EmptyState(
                    icon: Icons.add_card_rounded,
                    title: 'Sin actividad reciente',
                    message:
                        'Tus ingresos, gastos y metas se mantendran privados y organizados desde aqui.',
                  )
                : Column(
                    children: transactions
                        .take(4)
                        .map((item) => TransactionTile(transaction: item))
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}

List<FlSpot> _monthlyFlowSpots(List<FinanceTransaction> transactions) {
  final now = DateTime.now();
  return List.generate(6, (index) {
    final date = DateTime(now.year, now.month, now.day - 5 + index);
    var net = 0.0;
    for (final transaction in transactions) {
      if (transaction.date.year == date.year &&
          transaction.date.month == date.month &&
          transaction.date.day == date.day) {
        net += transaction.type == TransactionType.income
            ? transaction.amount
            : -transaction.amount;
      }
    }
    return FlSpot(index.toDouble(), (net / 100000).clamp(-10, 10).toDouble());
  });
}

class _BalanceHero extends StatelessWidget {
  const _BalanceHero({required this.balance});

  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF10231F), Color(0xFF10B981), Color(0xFF2563EB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white24,
                foregroundColor: Colors.white,
                child: Icon(Icons.account_balance_wallet_rounded),
              ),
              const Spacer(),
              Text(
                'Cuenta principal',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            'Balance total',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(
              balance,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniMetric extends StatelessWidget {
  const _MiniMetric({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MonetraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
