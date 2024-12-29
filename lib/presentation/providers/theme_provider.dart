import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:fitnest/domain/repositories/theme_repository.dart';
import 'package:fitnest/core/di/service_locator.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier(getIt<ThemeRepository>());
});

class ThemeNotifier extends StateNotifier<bool> {
  final ThemeRepository _themeRepository;

  ThemeNotifier(this._themeRepository) : super(false) {
    loadTheme();
  }

  @visibleForTesting
  Future<void> loadTheme() async {
    state = await _themeRepository.isDarkMode();
  }

  Future<void> toggleTheme() async {
    await _themeRepository.setDarkMode(!state);
    state = !state;
  }

  void setInitialTheme(bool isDark) {
    state = isDark;
  }

  bool get isDarkMode => state;
} 