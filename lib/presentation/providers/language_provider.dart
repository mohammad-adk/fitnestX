import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitnest/domain/repositories/language_repository.dart';
import 'package:fitnest/core/di/service_locator.dart';

part 'language_provider.g.dart';

@Riverpod(keepAlive: true)
class Language extends _$Language {
  late final LanguageRepository _repository;

  @override
  Future<String> build() async {
    _repository = getIt<LanguageRepository>();
    return _repository.getLanguage();
  }

  Future<void> setLanguage(String languageCode) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.setLanguage(languageCode);
      return languageCode;
    });
  }

  Future<void> setInitialLanguage(String language) async {
    state = AsyncValue.data(language);
  }
} 