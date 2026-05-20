import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/bootstrap/app_bootstrap.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/profile/presentation/profile_providers.dart';
import 'shared/widgets/home_widget_sync.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final overrides = await buildProviderOverrides();

  runApp(ProviderScope(overrides: overrides, child: const MonetraApp()));
}

class MonetraApp extends ConsumerWidget {
  const MonetraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return HomeWidgetSync(
      child: MaterialApp.router(
        title: 'Monetra',
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: ref.watch(appRouterProvider),
      ),
    );
  }
}
