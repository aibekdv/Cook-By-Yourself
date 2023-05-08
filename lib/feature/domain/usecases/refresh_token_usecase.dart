import 'package:cook_by_yourself/feature/domain/repositories/credential_repository.dart';

class RefreshTokenUseCase {
  final CredentialRepository credentialRepository;

  RefreshTokenUseCase({required this.credentialRepository});

  Future<void> call() async {
    return await credentialRepository.refreshToken();
  }
}
