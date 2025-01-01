import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitnest/core/constants/app_constants.dart';
import 'package:fitnest/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final SharedPreferences _prefs;

  LanguageRepositoryImpl(this._prefs);

  @override
  Future<String> getLanguage() async {
    return _prefs.getString(AppConstants.languageKey) ?? 'en';
  }

  @override
  Future<void> setLanguage(String languageCode) async {
    await _prefs.setString(AppConstants.languageKey, languageCode);
  }
} 