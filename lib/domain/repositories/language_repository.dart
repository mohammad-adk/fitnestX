abstract class LanguageRepository {
  Future<String> getLanguage();
  Future<void> setLanguage(String languageCode);
} 