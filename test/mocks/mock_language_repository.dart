import 'package:fitnest/domain/repositories/language_repository.dart';

class MockLanguageRepository implements LanguageRepository {
  String _currentLanguage = 'en';
  bool _throwError = false;

  @override
  Future<String> getLanguage() async {
    if (_throwError) {
      throw Exception('Mock language repository error');
    }
    return _currentLanguage;
  }

  @override
  Future<void> setLanguage(String languageCode) async {
    if (_throwError) {
      throw Exception('Mock language repository error');
    }
    _currentLanguage = languageCode;
  }

  // Helper methods for testing
  void setMockLanguage(String value) {
    _currentLanguage = value;
  }

  set throwError(bool value) {
    _throwError = value;
  }
} 