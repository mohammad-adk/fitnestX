import 'package:fitnest/domain/entities/user_entity.dart';
import 'package:fitnest/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<UserEntity> execute(String email, String password) async {
    return _repository.signIn(email, password);
  }
} 