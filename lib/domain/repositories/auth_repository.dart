import 'package:fitnest/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> getCurrentUser();
  Future<UserEntity> signIn(String email, String password);
  Future<UserEntity> signUp(String email, String password, String name);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Stream<UserEntity?> get authStateChanges;
  Future<bool> isSignedIn();
}
