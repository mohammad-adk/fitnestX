import 'package:fitnest/domain/entities/user_entity.dart';
import 'package:fitnest/domain/usecases/auth/auth_usecases.dart';
import 'package:fitnest/domain/repositories/auth_repository.dart';
import 'package:fitnest/core/di/service_locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  late final GetCurrentUserUseCase _getCurrentUserUseCase;
  late final SignInUseCase _signInUseCase;
  late final SignUpUseCase _signUpUseCase;
  late final SignOutUseCase _signOutUseCase;
  late final ResetPasswordUseCase _resetPasswordUseCase;
  late final GetAuthStateChangesUseCase _getAuthStateChangesUseCase;
  late final IsSignedInUseCase _isSignedInUseCase;

  @override
  Future<UserEntity?> build() async {
    final repository = getIt<AuthRepository>();
    _getCurrentUserUseCase = GetCurrentUserUseCase(repository);
    _signInUseCase = SignInUseCase(repository);
    _signUpUseCase = SignUpUseCase(repository);
    _signOutUseCase = SignOutUseCase(repository);
    _resetPasswordUseCase = ResetPasswordUseCase(repository);
    _getAuthStateChangesUseCase = GetAuthStateChangesUseCase(repository);
    _isSignedInUseCase = IsSignedInUseCase(repository);
    
    return _getCurrentUserUseCase.execute();
  }

  Future<bool> isSignedIn() async {
    return _isSignedInUseCase.execute();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _signInUseCase.execute(email, password);
    });
  }

  Future<void> signUp(String email, String password, String name) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _signUpUseCase.execute(email, password, name);
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    await _signOutUseCase.execute();
    state = const AsyncValue.data(null);
  }

  Future<void> resetPassword(String email) async {
    await _resetPasswordUseCase.execute(email);
  }

  Stream<UserEntity?> getAuthStateChanges() {
    return _getAuthStateChangesUseCase.execute();
  }
} 