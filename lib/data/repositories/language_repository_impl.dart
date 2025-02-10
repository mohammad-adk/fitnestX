import 'package:fitnest/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitnest/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final SharedPreferences _prefs;

  LanguageRepositoryImpl(this._prefs);

  @override
  Future<String> getLanguage() async {
    return _prefs.getString(StorageKeys.language) ?? 'en';
  }

  @override
  Future<void> setLanguage(String languageCode) async {
    await _prefs.setString(StorageKeys.language, languageCode);
  }
} 