import 'package:fitnest/domain/entities/user_entity.dart';
import 'package:fitnest/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  Future<UserEntity> execute(String email, String password, String name) async {
    return _repository.signUp(email, password, name);
  }
} 