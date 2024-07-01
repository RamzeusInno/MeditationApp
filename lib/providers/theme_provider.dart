import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier({required themeMode}) : _themeMode = themeMode, super(themeMode);

  ThemeMode _themeMode;

  get themeMode => _themeMode;

  void switchThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    state = _themeMode;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
        (ref) => ThemeNotifier(themeMode: ThemeMode.light)
);
