import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';
import 'package:cook_by_yourself/feature/domain/repositories/credential_repository.dart';

class SignInUserUseCase {
  final CredentialRepository credentialRepository;

  SignInUserUseCase({required this.credentialRepository});

  Future<void> call(UserEntity user) async {
    return await credentialRepository.signInUser(user);
  }
}
