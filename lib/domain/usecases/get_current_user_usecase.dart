import 'package:fitnest/domain/entities/user_entity.dart';
import 'package:fitnest/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  Future<UserEntity?> execute() async {
    return _repository.getCurrentUser();
  }
} 