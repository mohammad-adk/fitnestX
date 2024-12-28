import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/theme_repository_impl.dart';
import '../../data/repositories/language_repository_impl.dart';
import '../../domain/repositories/theme_repository.dart';
import '../../domain/repositories/language_repository.dart';

class SettingsController {
  late final ThemeRepository _themeRepository;
  late final LanguageRepository _languageRepository;
  
  bool isDarkMode = false;
  String currentLanguage = 'en';

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _themeRepository = ThemeRepositoryImpl(prefs);
    _languageRepository = LanguageRepositoryImpl(prefs);

    isDarkMode = await _themeRepository.isDarkMode();
    currentLanguage = await _languageRepository.getLanguage();
  }

  ThemeRepository get themeRepository => _themeRepository;
  LanguageRepository get languageRepository => _languageRepository;
} 