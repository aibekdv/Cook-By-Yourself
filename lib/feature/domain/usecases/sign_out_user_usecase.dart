import 'package:cook_by_yourself/feature/domain/repositories/credential_repository.dart';

class SignOutUserCase {
  final CredentialRepository credentialRepository;

  SignOutUserCase({required this.credentialRepository});

  Future<void> call() async {
    return await credentialRepository.signOut();
  }
}
