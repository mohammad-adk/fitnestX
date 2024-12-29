import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/theme_repository.dart';
import '../../domain/repositories/language_repository.dart';
import '../../data/repositories/theme_repository_impl.dart';
import '../../data/repositories/language_repository_impl.dart';
import '../controllers/settings_controller.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External Services
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Repositories
  getIt.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<LanguageRepository>(
    () => LanguageRepositoryImpl(getIt<SharedPreferences>()),
  );

  // Controllers
  getIt.registerSingleton<SettingsController>(SettingsController(
    getIt<ThemeRepository>(),
    getIt<LanguageRepository>(),
  ));
}
