import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitnest/core/constants/storage_keys.dart';
import 'package:fitnest/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences _prefs;

  ThemeRepositoryImpl(this._prefs);

  @override
  Future<bool> isDarkMode() async {
    return _prefs.getBool(StorageKeys.theme) ?? false;
  }

  @override
  Future<void> setDarkMode(bool isDark) async {
    await _prefs.setBool(StorageKeys.theme, isDark);
  }
} 