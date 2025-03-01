import 'package:fitnest/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> execute() async {
    return _repository.signOut();
  }
} 