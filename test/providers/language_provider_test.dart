import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/presentation/providers/language_provider.dart';
import 'package:fitnest/core/di/service_locator.dart';
import 'package:fitnest/domain/repositories/language_repository.dart';
import '../mocks/mock_language_repository.dart';

void main() {
  late MockLanguageRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockLanguageRepository();
    getIt.registerSingleton<LanguageRepository>(mockRepository);
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
    getIt.reset();
  });

  test('initial state should load from repository', () async {
    mockRepository.setMockLanguage('fa');
    final initialState = container.read(languageProvider);
    expect(initialState.isLoading, true);

    await container.read(languageProvider.future);
    final loadedState = container.read(languageProvider);
    expect(loadedState.value, 'fa');
  });

  test('should set language', () async {
    await container.read(languageProvider.future); // Wait for initial load

    await container.read(languageProvider.notifier).setLanguage('fa');
    final newState = container.read(languageProvider);
    expect(newState.value, 'fa');
    expect(await mockRepository.getLanguage(), 'fa');
  });

  test('should handle error when setting language', () async {
    await container.read(languageProvider.future); // Wait for initial load
    mockRepository.throwError = true;

    await container.read(languageProvider.notifier).setLanguage('fa');
    final errorState = container.read(languageProvider);
    expect(errorState.hasError, true);
  });

  test('should set initial language', () async {
    await container.read(languageProvider.notifier).setInitialLanguage('fa');
    final state = container.read(languageProvider);
    expect(state.value, 'fa');
  });
} 