import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/presentation/providers/theme_provider.dart';
import 'package:fitnest/presentation/providers/language_provider.dart';

final settingsViewModelProvider = Provider.autoDispose((ref) => SettingsViewModel(ref));

class SettingsViewModel {
  final Ref _ref;

  SettingsViewModel(this._ref);

  AsyncValue<bool> get themeState => _ref.watch(themeProvider);
  AsyncValue<String> get languageState => _ref.watch(languageProvider);

  void toggleTheme() {
    _ref.read(themeProvider.notifier).toggleTheme();
  }

  void setLanguage(String languageCode) {
    _ref.read(languageProvider.notifier).setLanguage(languageCode);
  }
} 