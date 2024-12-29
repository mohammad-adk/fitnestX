import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:fitnest/domain/repositories/language_repository.dart';
import 'package:fitnest/core/di/service_locator.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier(getIt<LanguageRepository>());
});

class LanguageNotifier extends StateNotifier<String> {
  final LanguageRepository _languageRepository;

  LanguageNotifier(this._languageRepository) : super('en') {
    loadLanguage();
  }

  @visibleForTesting
  Future<void> loadLanguage() async {
    state = await _languageRepository.getLanguage();
  }

  Future<void> setLanguage(String languageCode) async {
    await _languageRepository.setLanguage(languageCode);
    state = languageCode;
  }

  void setInitialLanguage(String language) {
    state = language;
  }

  String get currentLanguage => state;
} 