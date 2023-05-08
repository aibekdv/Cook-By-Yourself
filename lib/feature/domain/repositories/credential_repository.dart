import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';

abstract class CredentialRepository {
  Future<void> signUpUser(UserEntity user);
  Future<void> signInUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> refreshToken();
  Future<void> resetPassword(String email);
}
