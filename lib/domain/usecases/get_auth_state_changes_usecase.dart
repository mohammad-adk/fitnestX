import 'package:fitnest/domain/entities/user_entity.dart';
import 'package:fitnest/domain/repositories/auth_repository.dart';

class GetAuthStateChangesUseCase {
  final AuthRepository _repository;

  GetAuthStateChangesUseCase(this._repository);

  Stream<UserEntity?> execute() {
    return _repository.authStateChanges;
  }
} 