import 'package:flutter/material.dart';
import '../../domain/repositories/theme_repository.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeRepository _themeRepository;
  bool _isDarkMode = false;

  ThemeProvider(this._themeRepository) {
    _loadTheme();
  }

  bool get isDarkMode => _isDarkMode;

  Future<void> _loadTheme() async {
    _isDarkMode = await _themeRepository.isDarkMode();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _themeRepository.setDarkMode(_isDarkMode);
    notifyListeners();
  }

  void setInitialTheme(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
} 