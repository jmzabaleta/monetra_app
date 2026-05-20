import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../shared/widgets/monetra_card.dart';
import '../../dashboard/presentation/finance_summary.dart';
import '../../savings/presentation/savings_providers.dart';
import '../../transactions/presentation/category_providers.dart';
import '../../transactions/presentation/transaction_providers.dart';
import 'profile_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final currency = ref.watch(currencyProvider);
    final quickMovementEnabled = ref.watch(quickMovementEnabledProvider);
    final summary = ref.watch(financeSummaryProvider);
    final transactions = ref.watch(transactionControllerProvider);
    final categories = ref.watch(categoryControllerProvider);
    final goals = ref.watch(savingsControllerProvider);
    final formatter = MoneyFormatter(currency);

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          MonetraCard(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 34,
                  backgroundColor: AppPalette.emerald,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.person_rounded, size: 34),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tu espacio Monetra',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Datos locales, privados y creados por ti.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _SummaryPill(
                  label: 'Balance',
                  value: formatter.format(summary.balance),
                  icon: Icons.account_balance_wallet_rounded,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _SummaryPill(
                  label: 'Movimientos',
                  value: transactions.length.toString(),
                  icon: Icons.swap_vert_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _SummaryPill(
                  label: 'Categorias',
                  value: categories.length.toString(),
                  icon: Icons.category_rounded,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _SummaryPill(
                  label: 'Metas',
                  value: goals.length.toString(),
                  icon: Icons.flag_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          MonetraCard(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Tema'),
                  subtitle: Text(_themeLabel(themeMode)),
                  trailing: DropdownButton<ThemeMode>(
                    value: themeMode,
                    underline: const SizedBox.shrink(),
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text('Sistema'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Claro'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Oscuro'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      ref.read(themeModeProvider.notifier).state = value;
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.payments_outlined),
                  title: const Text('Moneda'),
                  subtitle: Text(currency),
                  trailing: DropdownButton<String>(
                    value: currency,
                    underline: const SizedBox.shrink(),
                    items: const [
                      DropdownMenuItem(value: 'COP', child: Text('COP')),
                      DropdownMenuItem(value: 'USD', child: Text('USD')),
                      DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                      DropdownMenuItem(value: 'MXN', child: Text('MXN')),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      ref.read(currencyProvider.notifier).state = value;
                    },
                  ),
                ),
                const Divider(),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Icons.flash_on_rounded),
                  title: const Text('Registro rapido'),
                  subtitle: const Text(
                    'Activa un boton flotante para movimientos',
                  ),
                  value: quickMovementEnabled,
                  onChanged: (value) {
                    ref.read(quickMovementEnabledProvider.notifier).state =
                        value;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          MonetraCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Datos',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.storage_rounded),
                  title: const Text('Base local Isar'),
                  subtitle: const Text(
                    'Sin datos mock ni sincronizacion externa',
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.delete_forever_rounded),
                  title: const Text('Borrar todos los datos'),
                  subtitle: const Text(
                    'Elimina movimientos, categorias y metas',
                  ),
                  textColor: AppPalette.coral,
                  iconColor: AppPalette.coral,
                  onTap: () => _confirmClearAll(context, ref),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryPill extends StatelessWidget {
  const _SummaryPill({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MonetraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _confirmClearAll(BuildContext context, WidgetRef ref) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Borrar todo'),
      content: const Text(
        'Esta accion eliminara todos los movimientos, categorias y metas guardadas en este dispositivo.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Borrar todo'),
        ),
      ],
    ),
  );
  if (confirmed != true) return;
  ref.read(transactionControllerProvider.notifier).clear();
  ref.read(categoryControllerProvider.notifier).clear();
  ref.read(savingsControllerProvider.notifier).clear();
  ref.read(transactionSearchProvider.notifier).state = '';
  ref.read(transactionTypeFilterProvider.notifier).state = null;
  ref.read(transactionCategoryFilterProvider.notifier).state = null;
  ref.read(transactionDateRangeFilterProvider.notifier).state = null;
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Todos los datos fueron eliminados')),
    );
  }
}

String _themeLabel(ThemeMode mode) {
  return switch (mode) {
    ThemeMode.system => 'Usar configuracion del dispositivo',
    ThemeMode.light => 'Modo claro',
    ThemeMode.dark => 'Modo oscuro',
  };
}
