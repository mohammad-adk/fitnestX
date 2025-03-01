class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final bool isEmailVerified;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.isEmailVerified,
  });
} 