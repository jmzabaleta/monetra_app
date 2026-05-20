import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/isar_provider.dart';

Future<List<Override>> buildProviderOverrides() async {
  return [isarProvider.overrideWithValue(null)];
}
