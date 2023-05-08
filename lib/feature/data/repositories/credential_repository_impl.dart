import 'package:cook_by_yourself/feature/data/datasources/remote_data_source.dart';
import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';
import 'package:cook_by_yourself/feature/domain/repositories/credential_repository.dart';

class CredentialRepositoryImpl implements CredentialRepository {
  final CredentialRemoteDataSource credentialRemoteDataSource;

  CredentialRepositoryImpl({required this.credentialRemoteDataSource});

  @override
  Future<bool> isSignIn() async => await credentialRemoteDataSource.isSignIn();

  @override
  Future<void> signInUser(UserEntity user) async =>
      await credentialRemoteDataSource.signInUser(user);

  @override
  Future<void> signOut() async => await credentialRemoteDataSource.signOut();

  @override
  Future<void> signUpUser(UserEntity user) async =>
      await credentialRemoteDataSource.signUpUser(user);

  @override
  Future<void> refreshToken() async =>
      await credentialRemoteDataSource.refreshToken();

  @override
  Future<void> resetPassword(String email) async {
    return await credentialRemoteDataSource.resetPassword(email);
  }
}
