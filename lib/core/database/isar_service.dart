import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  IsarService._();

  static final IsarService instance = IsarService._();
  Isar? _isar;

  Future<Isar?> open(List<CollectionSchema<dynamic>> schemas) async {
    if (_isar != null && _isar!.isOpen) return _isar!;
    if (kIsWeb) return null;

    try {
      final directory = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        schemas,
        name: 'monetra',
        directory: directory.path,
      );
      return _isar!;
    } catch (error) {
      throw StateError('No se pudo inicializar la base de datos local: $error');
    }
  }
}
