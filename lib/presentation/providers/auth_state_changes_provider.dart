import 'package:fitnest/domain/entities/user_entity.dart';
import 'package:fitnest/presentation/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_changes_provider.g.dart';

@riverpod
Stream<UserEntity?> authStateChanges(ref) {
  // Access the auth provider to get auth state changes
  final auth = ref.watch(authProvider.notifier);
  
  // Use the public method from Auth provider
  return auth.getAuthStateChanges();
} 