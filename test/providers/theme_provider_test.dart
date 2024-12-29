import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/presentation/providers/theme_provider.dart';
import 'package:fitnest/core/di/service_locator.dart';
import 'package:fitnest/domain/repositories/theme_repository.dart';
import '../mocks/mock_theme_repository.dart';

void main() {
  late MockThemeRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockThemeRepository();
    getIt.registerSingleton<ThemeRepository>(mockRepository);
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
    getIt.reset();
  });

  test('initial state should load from repository', () async {
    mockRepository.setMockDarkMode(true);
    final initialState = container.read(themeProvider);
    expect(initialState.isLoading, true);

    await container.read(themeProvider.future);
    final loadedState = container.read(themeProvider);
    expect(loadedState.value, true);
  });

  test('should toggle theme', () async {
    mockRepository.setMockDarkMode(false);
    await container.read(themeProvider.future); // Wait for initial load

    await container.read(themeProvider.notifier).toggleTheme();
    final newState = container.read(themeProvider);
    expect(newState.value, true);
    expect(await mockRepository.isDarkMode(), true);
  });

  test('should handle error when toggling theme', () async {
    await container.read(themeProvider.future); // Wait for initial load
    mockRepository.throwError = true;

    await container.read(themeProvider.notifier).toggleTheme();
    final errorState = container.read(themeProvider);
    expect(errorState.hasError, true);
  });

  test('should set initial theme', () async {
    await container.read(themeProvider.notifier).setInitialTheme(true);
    final state = container.read(themeProvider);
    expect(state.value, true);
  });
} 