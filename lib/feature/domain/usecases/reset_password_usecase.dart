import 'package:cook_by_yourself/feature/domain/repositories/credential_repository.dart';

class ResetPasswordUseCase {
  final CredentialRepository credentialRepository;

  ResetPasswordUseCase({required this.credentialRepository});

  Future<void> call({required String email}) async {
    return await credentialRepository.resetPassword(email);
  }
}
