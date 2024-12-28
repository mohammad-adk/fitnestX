import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences _prefs;

  ThemeRepositoryImpl(this._prefs);

  @override
  Future<bool> isDarkMode() async {
    return _prefs.getBool(AppConstants.themeKey) ?? false;
  }

  @override
  Future<void> setDarkMode(bool isDark) async {
    await _prefs.setBool(AppConstants.themeKey, isDark);
  }
} 