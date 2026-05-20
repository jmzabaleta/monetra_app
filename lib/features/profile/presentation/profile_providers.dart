import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final currencyProvider = StateProvider<String>((ref) => 'COP');
final quickMovementEnabledProvider = StateProvider<bool>((ref) => false);
