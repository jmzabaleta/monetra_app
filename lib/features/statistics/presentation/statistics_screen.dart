import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_text.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/monetra_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../dashboard/presentation/finance_summary.dart';
import '../../profile/presentation/profile_providers.dart';
import '../../transactions/domain/category.dart';
import '../../transactions/domain/finance_transaction.dart';
import '../../transactions/domain/transaction_type.dart';
import '../../transactions/presentation/category_providers.dart';
import '../../transactions/presentation/transaction_providers.dart';

final statisticsMonthProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month);
});

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(financeSummaryProvider);
    final transactions = ref.watch(transactionControllerProvider);
    final categories = ref.watch(categoryControllerProvider);
    final month = ref.watch(statisticsMonthProvider);
    final formatter = MoneyFormatter(ref.watch(currencyProvider));
    final monthTransactions = transactions.where((transaction) {
      return transaction.date.year == month.year &&
          transaction.date.month == month.month;
    }).toList();
    final entries = _expensesByCategory(monthTransactions).entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topCategory = entries.isEmpty
        ? null
        : categoryById(entries.first.key, categories);
    final hasData = transactions.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Estadisticas')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          MonetraCard(
            child: Row(
              children: [
                IconButton.filledTonal(
                  tooltip: 'Mes anterior',
                  onPressed: () =>
                      ref.read(statisticsMonthProvider.notifier).state =
                          DateTime(month.year, month.month - 1),
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                Expanded(
                  child: Text(
                    DateText.monthYear(month),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton.filledTonal(
                  tooltip: 'Mes siguiente',
                  onPressed: () =>
                      ref.read(statisticsMonthProvider.notifier).state =
                          DateTime(month.year, month.month + 1),
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Gastos por categoria'),
          if (entries.isEmpty)
            const MonetraCard(
              child: EmptyState(
                icon: Icons.donut_large_rounded,
                title: 'Aun no hay gastos',
                message:
                    'Cuando registres gastos, Monetra mostrara tus categorias mas importantes.',
              ),
            )
          else ...[
            MonetraCard(
              child: SizedBox(
                height: 230,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 3,
                    centerSpaceRadius: 52,
                    sections: [
                      for (final entry in entries)
                        PieChartSectionData(
                          value: entry.value,
                          color: categoryById(entry.key, categories).color,
                          radius: 72,
                          title:
                              '${(entry.value / entries.fold(0.0, (sum, item) => sum + item.value) * 100).round()}%',
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 700),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            MonetraCard(
              child: Column(
                children: [
                  for (final entry in entries)
                    _CategoryExpenseRow(
                      category: categoryById(entry.key, categories),
                      amount: formatter.format(entry.value),
                    ),
                ],
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Ingresos vs gastos'),
          MonetraCard(
            child: SizedBox(
              height: 230,
              child: hasData
                  ? BarChart(
                      BarChartData(
                        maxY: _chartMaxY(transactions),
                        gridData: FlGridData(
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: Theme.of(
                              context,
                            ).dividerColor.withValues(alpha: .12),
                            strokeWidth: 1,
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        titlesData: const FlTitlesData(show: false),
                        barGroups: _buildMonthlyBars(transactions),
                      ),
                      duration: const Duration(milliseconds: 700),
                    )
                  : const EmptyState(
                      icon: Icons.bar_chart_rounded,
                      title: 'Sin tendencia todavia',
                      message:
                          'Tus proximos movimientos construiran una lectura visual de ingresos y gastos.',
                    ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: _InsightCard(
                  icon: Icons.leaderboard_rounded,
                  title: 'Mayor gasto',
                  value: topCategory == null ? 'Sin datos' : topCategory.name,
                  color: topCategory?.color ?? AppPalette.coral,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _InsightCard(
                  icon: _trendIcon(summary.balance),
                  title: 'Tendencia',
                  value: summary.balance >= 0 ? 'Positiva' : 'Ajustar',
                  color: summary.balance >= 0
                      ? AppPalette.emerald
                      : AppPalette.coral,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          MonetraCard(
            color: AppPalette.emerald.withValues(alpha: .12),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppPalette.emerald,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.lightbulb_rounded),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    hasData
                        ? 'Balance actual: ${formatter.format(summary.balance)}.'
                        : 'Monetra empieza sin datos para que cada grafica refleje solo tu realidad financiera.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MonetraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: .14),
            foregroundColor: color,
            child: Icon(icon),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _CategoryExpenseRow extends StatelessWidget {
  const _CategoryExpenseRow({required this.category, required this.amount});

  final FinanceCategory category;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: category.color.withValues(alpha: .15),
            foregroundColor: category.color,
            child: Icon(category.icon, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              category.name,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          Text(amount),
        ],
      ),
    );
  }
}

Map<String, double> _expensesByCategory(List<FinanceTransaction> transactions) {
  final result = <String, double>{};
  for (final transaction in transactions) {
    if (transaction.type != TransactionType.expense) continue;
    result.update(
      transaction.categoryId,
      (value) => value + transaction.amount,
      ifAbsent: () => transaction.amount,
    );
  }
  return result;
}

List<BarChartGroupData> _buildMonthlyBars(
  List<FinanceTransaction> transactions,
) {
  final now = DateTime.now();
  return List.generate(6, (index) {
    final month = DateTime(now.year, now.month - 5 + index);
    var income = 0.0;
    var expense = 0.0;
    for (final transaction in transactions) {
      if (transaction.date.year == month.year &&
          transaction.date.month == month.month) {
        if (transaction.type == TransactionType.income) {
          income += transaction.amount;
        } else {
          expense += transaction.amount;
        }
      }
    }
    return BarChartGroupData(
      x: index,
      barsSpace: 5,
      barRods: [
        BarChartRodData(
          toY: income,
          width: 10,
          color: AppPalette.emerald,
          borderRadius: BorderRadius.circular(8),
        ),
        BarChartRodData(
          toY: expense,
          width: 10,
          color: AppPalette.coral,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  });
}

double _chartMaxY(List<FinanceTransaction> transactions) {
  var maxValue = 0.0;
  for (final group in _buildMonthlyBars(transactions)) {
    for (final rod in group.barRods) {
      if (rod.toY > maxValue) maxValue = rod.toY;
    }
  }
  return maxValue <= 0 ? 1 : maxValue * 1.2;
}

IconData _trendIcon(double balance) {
  return balance >= 0 ? Icons.trending_up_rounded : Icons.trending_down_rounded;
}
