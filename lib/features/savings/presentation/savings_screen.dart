import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_text.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/modal_form_container.dart';
import '../../../shared/widgets/monetra_card.dart';
import '../../profile/presentation/profile_providers.dart';
import '../domain/saving_goal.dart';
import 'savings_providers.dart';

class SavingsScreen extends ConsumerWidget {
  const SavingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goals = ref.watch(savingsControllerProvider);
    final formatter = MoneyFormatter(ref.watch(currencyProvider));

    return Scaffold(
      appBar: AppBar(title: const Text('Metas')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openGoalSheet(context, ref),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Crear meta'),
      ),
      body: goals.isEmpty
          ? const EmptyState(
              icon: Icons.flag_rounded,
              title: 'Sin metas activas',
              message: 'Crea metas de ahorro y sigue tu progreso.',
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: goals.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final goal = goals[index];
                return MonetraCard(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppRadii.lg),
                    onTap: () => _openGoalSheet(context, ref, goal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppPalette.cobalt.withValues(
                                alpha: .13,
                              ),
                              foregroundColor: AppPalette.cobalt,
                              child: const Icon(Icons.savings_rounded),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                goal.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: const Text('Editar'),
                                  onTap: () =>
                                      _openGoalSheet(context, ref, goal),
                                ),
                                PopupMenuItem(
                                  child: const Text('Eliminar'),
                                  onTap: () async {
                                    await Future<void>.delayed(Duration.zero);
                                    if (context.mounted) {
                                      _confirmGoalDelete(context, ref, goal);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        TweenAnimationBuilder<double>(
                          tween: Tween(
                            begin: 0,
                            end: goal.progress.clamp(0, 1),
                          ),
                          duration: const Duration(milliseconds: 700),
                          builder: (context, value, _) {
                            return LinearProgressIndicator(
                              value: value,
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(999),
                            );
                          },
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${formatter.format(goal.savedAmount)} de ${formatter.format(goal.targetAmount)}',
                              ),
                            ),
                            Text(
                              '${(goal.progress.clamp(0, 1) * 100).round()}%',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              DateText.monthYear(goal.dueDate),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

void _openGoalSheet(BuildContext context, WidgetRef ref, [SavingGoal? goal]) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _GoalForm(initial: goal),
  );
}

Future<void> _confirmGoalDelete(
  BuildContext context,
  WidgetRef ref,
  SavingGoal goal,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Eliminar meta'),
      content: Text('Se eliminara "${goal.name}" de forma permanente.'),
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
  ref.read(savingsControllerProvider.notifier).remove(goal.id);
  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Meta eliminada')));
  }
}

class _GoalForm extends ConsumerStatefulWidget {
  const _GoalForm({this.initial});

  final SavingGoal? initial;

  @override
  ConsumerState<_GoalForm> createState() => _GoalFormState();
}

class _GoalFormState extends ConsumerState<_GoalForm> {
  late final name = TextEditingController(text: widget.initial?.name ?? '');
  late final target = TextEditingController(
    text: widget.initial?.targetAmount.toStringAsFixed(0) ?? '',
  );
  late final saved = TextEditingController(
    text: widget.initial?.savedAmount.toStringAsFixed(0) ?? '',
  );
  late DateTime dueDate =
      widget.initial?.dueDate ?? DateTime.now().add(const Duration(days: 120));

  @override
  Widget build(BuildContext context) {
    return ModalFormContainer(
      children: [
        Text(
          widget.initial == null ? 'Nueva meta' : 'Editar meta',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: name,
          decoration: const InputDecoration(
            labelText: 'Nombre',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: target,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            labelText: 'Cantidad objetivo',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: saved,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            labelText: 'Cantidad ahorrada',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          borderRadius: BorderRadius.circular(AppRadii.md),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: dueDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 3650)),
            );
            if (picked == null) return;
            setState(() => dueDate = picked);
          },
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Fecha objetivo',
              prefixIcon: Icon(Icons.calendar_today_rounded),
            ),
            child: Text(DateText.monthYear(dueDate)),
          ),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          icon: const Icon(Icons.check_rounded),
          label: const Text('Guardar'),
          onPressed: () {
            final parsedTarget = double.tryParse(target.text) ?? 0;
            final parsedSaved = double.tryParse(saved.text) ?? 0;
            if (name.text.trim().isEmpty || parsedTarget <= 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Ingresa un nombre y cantidad objetivo válida'),
                ),
              );
              return;
            }
            ref
                .read(savingsControllerProvider.notifier)
                .save(
                  SavingGoal(
                    id: widget.initial?.id ?? '',
                    name: name.text.trim(),
                    targetAmount: parsedTarget,
                    savedAmount: parsedSaved,
                    dueDate: dueDate,
                  ),
                );
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Meta guardada')));
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    name.dispose();
    target.dispose();
    saved.dispose();
    super.dispose();
  }
}
