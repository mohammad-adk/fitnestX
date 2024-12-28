import 'package:flutter/material.dart';
import '../../domain/repositories/language_repository.dart';

class LanguageProvider extends ChangeNotifier {
  final LanguageRepository _languageRepository;
  String _currentLanguage = 'en';

  LanguageProvider(this._languageRepository) {
    _loadLanguage();
  }

  String get currentLanguage => _currentLanguage;

  Future<void> _loadLanguage() async {
    _currentLanguage = await _languageRepository.getLanguage();
    notifyListeners();
  }

  Future<void> setLanguage(String languageCode) async {
    _currentLanguage = languageCode;
    await _languageRepository.setLanguage(languageCode);
    notifyListeners();
  }

  void setInitialLanguage(String language) {
    _currentLanguage = language;
    notifyListeners();
  }
} 