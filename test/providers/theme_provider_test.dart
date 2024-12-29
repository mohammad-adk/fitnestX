import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/presentation/providers/theme_provider.dart';
import '../mocks/mock_theme_repository.dart';

void main() {
  late MockThemeRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockThemeRepository();
    container = ProviderContainer(
      overrides: [
        themeProvider.overrideWith((ref) => ThemeNotifier(mockRepository)),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state should be false', () {
    expect(container.read(themeProvider), false);
  });

  test('should load theme from repository', () async {
    mockRepository.setMockDarkMode(true);
    final notifier = container.read(themeProvider.notifier);
    await notifier.loadTheme();
    expect(container.read(themeProvider), true);
  });

  test('should toggle theme', () async {
    final notifier = container.read(themeProvider.notifier);
    final initialState = container.read(themeProvider);
    await notifier.toggleTheme();
    expect(container.read(themeProvider), !initialState);
    expect(await mockRepository.isDarkMode(), !initialState);
  });

  test('should set initial theme', () {
    final notifier = container.read(themeProvider.notifier);
    notifier.setInitialTheme(true);
    expect(container.read(themeProvider), true);
  });
} 