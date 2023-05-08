import 'package:cook_by_yourself/feature/domain/repositories/credential_repository.dart';

class IsSignInUseCase {
  final CredentialRepository credentialRepository;

  IsSignInUseCase({required this.credentialRepository});

  Future<bool> call() async => await credentialRepository.isSignIn();
}
