class UserEntity {
  final String email;
  final String? password;
  final String? password2;

  UserEntity({
    required this.email,
    this.password,
    this.password2,
  });
}
