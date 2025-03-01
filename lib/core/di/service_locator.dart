import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitnest/domain/repositories/theme_repository.dart';
import 'package:fitnest/domain/repositories/language_repository.dart';
import 'package:fitnest/data/repositories/theme_repository_impl.dart';
import 'package:fitnest/data/repositories/language_repository_impl.dart';
import 'package:fitnest/core/controllers/settings_controller.dart';
import 'package:fitnest/domain/repositories/auth_repository.dart';
import 'package:fitnest/data/repositories/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Register Firebase services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  
  // Register Auth Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuth: getIt<FirebaseAuth>(), 
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
}
