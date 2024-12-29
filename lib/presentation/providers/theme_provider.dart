import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitnest/domain/repositories/theme_repository.dart';
import 'package:fitnest/core/di/service_locator.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  late final ThemeRepository _repository;

  @override
  Future<bool> build() async {
    _repository = getIt<ThemeRepository>();
    return _repository.isDarkMode();
  }

  Future<void> toggleTheme() async {
    final currentState = state.valueOrNull ?? false;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.setDarkMode(!currentState);
      return !currentState;
    });
  }

  Future<void> setInitialTheme(bool isDark) async {
    state = AsyncValue.data(isDark);
  }
} 