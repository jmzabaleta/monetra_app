import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/utils/date_text.dart';
import '../../features/profile/presentation/profile_providers.dart';
import '../../features/transactions/domain/category.dart';
import '../../features/transactions/domain/finance_transaction.dart';
import '../../features/transactions/domain/transaction_type.dart';
import '../../features/transactions/presentation/category_providers.dart';

class TransactionTile extends ConsumerWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
    this.onTap,
    this.onDelete,
  });

  final FinanceTransaction transaction;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = MoneyFormatter(ref.watch(currencyProvider));
    final category = categoryById(
      transaction.categoryId,
      ref.watch(categoryControllerProvider),
    );
    final isIncome = transaction.type == TransactionType.income;
    final amountColor = isIncome ? AppPalette.emerald : AppPalette.coral;
    final typeLabel = isIncome ? 'Ingreso' : 'Gasto';
    final typeIcon = isIncome
        ? Icons.arrow_downward_rounded
        : Icons.arrow_upward_rounded;

    return InkWell(
      borderRadius: BorderRadius.circular(AppRadii.md),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: category.color.withValues(alpha: .14),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(category.icon, color: category.color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _MetaChip(
                        icon: typeIcon,
                        label: typeLabel,
                        color: amountColor,
                      ),
                      _MetaChip(
                        icon: Icons.category_rounded,
                        label: category.name,
                        color: category.color,
                      ),
                      Text(
                        DateText.short(transaction.date),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  if (transaction.note.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    Text(
                      transaction.note,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${isIncome ? '+' : '-'}${formatter.format(transaction.amount)}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: amountColor,
                  ),
                ),
                if (onDelete != null)
                  IconButton(
                    tooltip: 'Eliminar',
                    icon: const Icon(Icons.delete_outline_rounded),
                    onPressed: onDelete,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
