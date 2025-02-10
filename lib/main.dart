import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fitnest/core/constants/app_constants.dart';
import 'package:fitnest/config/theme/app_theme.dart';
import 'package:fitnest/presentation/providers/theme_provider.dart';
import 'package:fitnest/presentation/providers/language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fitnest/config/router/app_router.dart';
import 'package:fitnest/core/di/service_locator.dart';
import 'package:fitnest/config/localization/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final languageState = ref.watch(languageProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeState.when(
        loading: () => ThemeMode.system,
        error: (_, __) => ThemeMode.system,
        data: (isDark) => isDark ? ThemeMode.dark : ThemeMode.light,
      ),
      locale: languageState.when(
        loading: () => const Locale('en'),
        error: (_, __) => const Locale('en'),
        data: (lang) => Locale(lang),
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: AppRouter.router,
    );
  }
}
