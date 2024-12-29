import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/presentation/providers/language_provider.dart';
import '../mocks/mock_language_repository.dart';

void main() {
  late MockLanguageRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockLanguageRepository();
    container = ProviderContainer(
      overrides: [
        languageProvider.overrideWith((ref) => LanguageNotifier(mockRepository)),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state should be en', () {
    expect(container.read(languageProvider), 'en');
  });

  test('should load language from repository', () async {
    mockRepository.setMockLanguage('fa');
    final notifier = container.read(languageProvider.notifier);
    await notifier.loadLanguage();
    expect(container.read(languageProvider), 'fa');
  });

  test('should set language', () async {
    final notifier = container.read(languageProvider.notifier);
    await notifier.setLanguage('fa');
    expect(container.read(languageProvider), 'fa');
    expect(await mockRepository.getLanguage(), 'fa');
  });

  test('should set initial language', () {
    final notifier = container.read(languageProvider.notifier);
    notifier.setInitialLanguage('fa');
    expect(container.read(languageProvider), 'fa');
  });
} 