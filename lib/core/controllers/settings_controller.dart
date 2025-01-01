import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/domain/repositories/theme_repository.dart';
import 'package:fitnest/domain/repositories/language_repository.dart';
import 'package:fitnest/core/di/service_locator.dart';
import 'package:fitnest/core/controllers/settings_state.dart';

final settingsControllerProvider = StateNotifierProvider<SettingsController, SettingsState>((ref) {
  return SettingsController(
    getIt<ThemeRepository>(),
    getIt<LanguageRepository>(),
  );
});

class SettingsController extends StateNotifier<SettingsState> {
  final ThemeRepository _themeRepository;
  final LanguageRepository _languageRepository;

  SettingsController(this._themeRepository, this._languageRepository)
      : super(const SettingsState()) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final isDarkMode = await _themeRepository.isDarkMode();
      final currentLanguage = await _languageRepository.getLanguage();
      state = state.copyWith(
        isDarkMode: isDarkMode,
        currentLanguage: currentLanguage,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load settings: $e',
      );
    }
  }

  // Settings-specific operations only
  bool get isLoading => state.isLoading;
  String? get error => state.error;
  
  void clearError() {
    if (state.error != null) {
      state = state.copyWith(error: null);
    }
  }
} 