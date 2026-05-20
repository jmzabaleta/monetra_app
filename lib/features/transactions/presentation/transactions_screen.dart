import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/date_text.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/modal_form_container.dart';
import '../../../shared/widgets/monetra_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/transaction_tile.dart';
import '../domain/category.dart';
import '../domain/finance_transaction.dart';
import '../domain/transaction_type.dart';
import 'category_providers.dart';
import 'transaction_providers.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(filteredTransactionsProvider);
    final allTransactions = ref.watch(transactionControllerProvider);
    final categories = ref.watch(categoryControllerProvider);
    final typeFilter = ref.watch(transactionTypeFilterProvider);
    final categoryFilter = ref.watch(transactionCategoryFilterProvider);
    final dateRange = ref.watch(transactionDateRangeFilterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Movimientos')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openCreateMenu(context, categories),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Agregar'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          SectionHeader(
            title: 'Categorias',
            action: TextButton.icon(
              onPressed: () => _openCategorySheet(context),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Nueva'),
            ),
          ),
          _CategoryStrip(categories: categories, transactions: allTransactions),
          const SizedBox(height: AppSpacing.lg),
          TextField(
            onChanged: (value) =>
                ref.read(transactionSearchProvider.notifier).state = value,
            decoration: const InputDecoration(
              hintText: 'Buscar por titulo o nota',
              prefixIcon: Icon(Icons.search_rounded),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SegmentedButton<TransactionType?>(
            segments: const [
              ButtonSegment(value: null, label: Text('Todo')),
              ButtonSegment(
                value: TransactionType.income,
                label: Text('Ingresos'),
              ),
              ButtonSegment(
                value: TransactionType.expense,
                label: Text('Gastos'),
              ),
            ],
            selected: {typeFilter},
            onSelectionChanged: (value) {
              ref.read(transactionTypeFilterProvider.notifier).state =
                  value.first;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String?>(
                  initialValue: categoryFilter,
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text('Todas las categorias'),
                    ),
                    for (final category in categories)
                      DropdownMenuItem(
                        value: category.id,
                        child: Text(category.name),
                      ),
                  ],
                  onChanged: (value) =>
                      ref
                              .read(transactionCategoryFilterProvider.notifier)
                              .state =
                          value,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              IconButton.filledTonal(
                tooltip: 'Filtrar fechas',
                onPressed: () async {
                  final picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialDateRange: dateRange,
                  );
                  if (picked == null) return;
                  ref.read(transactionDateRangeFilterProvider.notifier).state =
                      picked;
                },
                icon: const Icon(Icons.date_range_rounded),
              ),
            ],
          ),
          if (dateRange != null) ...[
            const SizedBox(height: AppSpacing.sm),
            InputChip(
              avatar: const Icon(Icons.calendar_month_rounded, size: 18),
              label: Text(
                '${DateText.short(dateRange.start)} - ${DateText.short(dateRange.end)}',
              ),
              onDeleted: () =>
                  ref.read(transactionDateRangeFilterProvider.notifier).state =
                      null,
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          if (allTransactions.isEmpty)
            const MonetraCard(
              child: EmptyState(
                icon: Icons.receipt_long_rounded,
                title: 'Tu espacio financiero esta limpio',
                message:
                    'Crea una categoria y registra tu primer ingreso o gasto para activar balances y estadisticas.',
              ),
            )
          else if (transactions.isEmpty)
            const EmptyState(
              icon: Icons.search_off_rounded,
              title: 'Sin resultados',
              message: 'Ajusta la busqueda o cambia los filtros activos.',
            )
          else
            MonetraCard(
              child: Column(
                children: [
                  for (final item in transactions)
                    TransactionTile(
                      transaction: item,
                      onTap: () => _openTransactionSheet(context, item),
                      onDelete: () =>
                          _confirmTransactionDelete(context, ref, item),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _CategoryStrip extends ConsumerWidget {
  const _CategoryStrip({required this.categories, required this.transactions});

  final List<FinanceCategory> categories;
  final List<FinanceTransaction> transactions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (categories.isEmpty) {
      return MonetraCard(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppPalette.emerald.withValues(alpha: .12),
              foregroundColor: AppPalette.emerald,
              child: const Icon(Icons.auto_awesome_rounded),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Define categorias propias para que Monetra se adapte a tu vida real desde cero.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          return InputChip(
            avatar: Icon(category.icon, color: category.color, size: 18),
            label: Text(category.name),
            onPressed: () => _openCategorySheet(context, category),
            onDeleted: () => _confirmCategoryDelete(
              context,
              ref,
              category,
              transactions
                  .where((item) => item.categoryId == category.id)
                  .length,
            ),
          );
        },
      ),
    );
  }
}

Future<void> _confirmTransactionDelete(
  BuildContext context,
  WidgetRef ref,
  FinanceTransaction transaction,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Eliminar movimiento'),
      content: Text('Se eliminara "${transaction.title}" de forma permanente.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Eliminar'),
        ),
      ],
    ),
  );
  if (confirmed != true) return;
  ref.read(transactionControllerProvider.notifier).remove(transaction.id);
  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Movimiento eliminado')));
  }
}

Future<void> _confirmCategoryDelete(
  BuildContext context,
  WidgetRef ref,
  FinanceCategory category,
  int useCount,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Eliminar categoria'),
      content: Text(
        useCount == 0
            ? 'Se eliminara "${category.name}".'
            : '"${category.name}" esta usada en $useCount movimientos. Si continuas, esos movimientos quedaran sin categoria.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Eliminar'),
        ),
      ],
    ),
  );
  if (confirmed != true) return;
  ref.read(categoryControllerProvider.notifier).remove(category.id);
  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Categoria eliminada')));
  }
}

void _openTransactionSheet(
  BuildContext context, [
  FinanceTransaction? transaction,
]) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _TransactionForm(initial: transaction),
  );
}

void _openCreateMenu(BuildContext context, List<FinanceCategory> categories) {
  if (categories.isEmpty) {
    _openCategorySheet(context);
    return;
  }

  showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    builder: (sheetContext) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.swap_vert_rounded),
                ),
                title: const Text('Nuevo movimiento'),
                subtitle: const Text('Registrar ingreso o gasto'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _openTransactionSheet(context);
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.category_rounded),
                ),
                title: const Text('Nueva categoria'),
                subtitle: const Text('Crear otra categoria personalizada'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _openCategorySheet(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _openCategorySheet(BuildContext context, [FinanceCategory? category]) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _CategoryForm(initial: category),
  );
}

class _TransactionForm extends ConsumerStatefulWidget {
  const _TransactionForm({this.initial});

  final FinanceTransaction? initial;

  @override
  ConsumerState<_TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends ConsumerState<_TransactionForm> {
  late final title = TextEditingController(text: widget.initial?.title ?? '');
  late final amount = TextEditingController(
    text: widget.initial == null
        ? ''
        : widget.initial!.amount.toStringAsFixed(0),
  );
  late final note = TextEditingController(text: widget.initial?.note ?? '');
  late TransactionType type = widget.initial?.type ?? TransactionType.expense;
  late String? categoryId = widget.initial?.categoryId;
  late DateTime date = widget.initial?.date ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryControllerProvider);
    categoryId ??= categories.isEmpty ? null : categories.first.id;

    return ModalFormContainer(
      children: [
        Text(
          widget.initial == null ? 'Nuevo movimiento' : 'Editar movimiento',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 16),
        if (categories.isEmpty) ...[
          const EmptyState(
            icon: Icons.category_rounded,
            title: 'Primero crea una categoria',
            message:
                'Las categorias mantienen tus ingresos y gastos organizados desde el inicio.',
          ),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(context);
              _openCategorySheet(context);
            },
            icon: const Icon(Icons.add_rounded),
            label: const Text('Crear categoria'),
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
          const SizedBox(height: 12),
          TextField(
            controller: title,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Titulo'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: amount,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(labelText: 'Monto'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: categoryId,
            items: categories
                .map(
                  (item) =>
                      DropdownMenuItem(value: item.id, child: Text(item.name)),
                )
                .toList(),
            onChanged: (value) => setState(() => categoryId = value),
            decoration: const InputDecoration(labelText: 'Categoria'),
          ),
          const SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(AppRadii.md),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked == null) return;
              setState(() => date = picked);
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Fecha',
                prefixIcon: Icon(Icons.calendar_today_rounded),
              ),
              child: Text(DateText.short(date)),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: note,
            minLines: 1,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Nota opcional'),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {
              final parsedAmount = double.tryParse(amount.text) ?? 0;
              if (title.text.trim().isEmpty ||
                  parsedAmount <= 0 ||
                  categoryId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Completa los campos requeridos'),
                  ),
                );
                return;
              }
              ref
                  .read(transactionControllerProvider.notifier)
                  .save(
                    FinanceTransaction(
                      id: widget.initial?.id ?? '',
                      title: title.text.trim(),
                      amount: parsedAmount,
                      type: type,
                      categoryId: categoryId!,
                      date: date,
                      note: note.text.trim(),
                    ),
                  );
              Navigator.pop(context);
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                const SnackBar(content: Text('Movimiento guardado')),
              );
            },
            icon: const Icon(Icons.check_rounded),
            label: const Text('Guardar'),
          ),
        ],
      ],
    );
  }

  @override
  void dispose() {
    title.dispose();
    amount.dispose();
    note.dispose();
    super.dispose();
  }
}

class _CategoryForm extends ConsumerStatefulWidget {
  const _CategoryForm({this.initial});

  final FinanceCategory? initial;

  @override
  ConsumerState<_CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends ConsumerState<_CategoryForm> {
  late final name = TextEditingController(text: widget.initial?.name ?? '');
  late IconData icon = widget.initial?.icon ?? categoryIconOptions.first;
  late Color color = widget.initial?.color ?? categoryColorOptions.first;

  @override
  Widget build(BuildContext context) {
    return ModalFormContainer(
      children: [
        Text(
          widget.initial == null ? 'Nueva categoria' : 'Editar categoria',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: name,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(labelText: 'Nombre'),
        ),
        const SizedBox(height: 16),
        Text(
          'Icono',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final option in categoryIconOptions)
              ChoiceChip(
                selected: icon.codePoint == option.codePoint,
                avatar: Icon(option, size: 18),
                label: const SizedBox.shrink(),
                onSelected: (_) => setState(() => icon = option),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Color',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final option in categoryColorOptions)
              InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: () => setState(() => color = option),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: option,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: color == option
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () {
            if (name.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ingresa un nombre')),
              );
              return;
            }
            ref
                .read(categoryControllerProvider.notifier)
                .save(
                  FinanceCategory(
                    id: widget.initial?.id ?? '',
                    name: name.text.trim(),
                    icon: icon,
                    color: color,
                  ),
                );
            Navigator.pop(context);
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              const SnackBar(content: Text('Categoria guardada')),
            );
          },
          icon: const Icon(Icons.check_rounded),
          label: const Text('Guardar'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }
}
