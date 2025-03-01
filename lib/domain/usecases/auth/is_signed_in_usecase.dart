import 'package:fitnest/domain/repositories/auth_repository.dart';

class IsSignedInUseCase {
  final AuthRepository _repository;

  IsSignedInUseCase(this._repository);

  Future<bool> execute() async {
    return _repository.isSignedIn();
  }
} 