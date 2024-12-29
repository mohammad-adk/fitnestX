import '../../domain/repositories/theme_repository.dart';
import '../../domain/repositories/language_repository.dart';
import '../di/service_locator.dart';

class SettingsController {
  final ThemeRepository _themeRepository;
  final LanguageRepository _languageRepository;
  
  bool isDarkMode = false;
  String currentLanguage = 'en';

  SettingsController()
      : _themeRepository = getIt<ThemeRepository>(),
        _languageRepository = getIt<LanguageRepository>();

  Future<void> loadSettings() async {
    isDarkMode = await _themeRepository.isDarkMode();
    currentLanguage = await _languageRepository.getLanguage();
  }

  ThemeRepository get themeRepository => _themeRepository;
  LanguageRepository get languageRepository => _languageRepository;
} 