import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../features/transactions/domain/finance_transaction.dart';
import '../../features/transactions/domain/transaction_type.dart';
import '../../features/transactions/presentation/category_providers.dart';
import '../../features/transactions/presentation/transaction_providers.dart';
import 'empty_state.dart';
import 'modal_form_container.dart';

void openQuickMovementSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => const QuickMovementSheet(),
  );
}

class QuickMovementSheet extends ConsumerStatefulWidget {
  const QuickMovementSheet({super.key});

  @override
  ConsumerState<QuickMovementSheet> createState() => _QuickMovementSheetState();
}

class _QuickMovementSheetState extends ConsumerState<QuickMovementSheet> {
  final amount = TextEditingController();
  final note = TextEditingController();
  TransactionType type = TransactionType.expense;
  String? categoryId;

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryControllerProvider);
    categoryId ??= categories.isEmpty ? null : categories.first.id;

    return ModalFormContainer(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: .14),
              foregroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.flash_on_rounded),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Movimiento rapido',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        if (categories.isEmpty) ...[
          const EmptyState(
            icon: Icons.category_rounded,
            title: 'Crea una categoria primero',
            message:
                'El registro rapido necesita al menos una categoria para guardar el movimiento.',
          ),
        ] else ...[
          SegmentedButton<TransactionType>(
            segments: const [
              ButtonSegment(
                value: TransactionType.expense,
                label: Text('Gasto'),
                icon: Icon(Icons.south_west_rounded),
              ),
              ButtonSegment(
                value: TransactionType.income,
                label: Text('Ingreso'),
                icon: Icon(Icons.north_east_rounded),
              ),
            ],
            selected: {type},
            onSelectionChanged: (value) => setState(() => type = value.first),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: amount,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Monto',
              prefixIcon: Icon(Icons.payments_rounded),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          DropdownButtonFormField<String>(
            initialValue: categoryId,
            items: categories
                .map(
                  (category) => DropdownMenuItem(
                    value: category.id,
                    child: Text(category.name),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => categoryId = value),
            decoration: const InputDecoration(
              labelText: 'Categoria',
              prefixIcon: Icon(Icons.category_rounded),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: note,
            decoration: const InputDecoration(
              labelText: 'Nota opcional',
              prefixIcon: Icon(Icons.notes_rounded),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.check_rounded),
            label: const Text('Guardar movimiento'),
          ),
        ],
      ],
    );
  }

  void _save() {
    final parsedAmount = double.tryParse(amount.text) ?? 0;
    if (parsedAmount <= 0 || categoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Ingresa un monto valido')));
      return;
    }

    ref
        .read(transactionControllerProvider.notifier)
        .save(
          FinanceTransaction(
            id: '',
            title: type == TransactionType.income
                ? 'Ingreso rapido'
                : 'Gasto rapido',
            amount: parsedAmount,
            type: type,
            categoryId: categoryId!,
            date: DateTime.now(),
            note: note.text.trim(),
          ),
        );

    Navigator.pop(context);
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      const SnackBar(content: Text('Movimiento rapido guardado')),
    );
  }

  @override
  void dispose() {
    amount.dispose();
    note.dispose();
    super.dispose();
  }
}
