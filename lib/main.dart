import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/controllers/settings_controller.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/providers/language_provider.dart';
import 'core/localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final settings = SettingsController();
  await settings.loadSettings();
  
  runApp(MyApp(settings: settings));
}

class MyApp extends StatelessWidget {
  final SettingsController settings;
  
  const MyApp({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(settings.themeRepository)
            ..setInitialTheme(settings.isDarkMode),
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(settings.languageRepository)
            ..setInitialLanguage(settings.currentLanguage),
        ),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return MaterialApp.router(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            locale: Locale(languageProvider.currentLanguage),
            supportedLocales: const [
              Locale('en'),
              Locale('fa'),
            ],
            localizationsDelegates: [
              _AppLocalizationsDelegate(),
              ...GlobalMaterialLocalizations.delegates,
            ],
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) => ['en', 'fa'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
