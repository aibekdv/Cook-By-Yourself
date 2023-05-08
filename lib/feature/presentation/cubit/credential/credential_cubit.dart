import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';
import 'package:cook_by_yourself/feature/domain/usecases/reset_password_usecase.dart';
import 'package:cook_by_yourself/feature/domain/usecases/sign_in_user_usecase.dart';
import 'package:cook_by_yourself/feature/domain/usecases/sign_up_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUserUseCase signInUserUseCase;
  final SignUpUserUseCase signUpUserUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  CredentialCubit({
    required this.signInUserUseCase,
    required this.signUpUserUseCase,
    required this.resetPasswordUseCase,
  }) : super(CredentialInitial());

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());
    try {
      await signInUserUseCase(UserEntity(email: email, password: password));
      emit(CredentialLoaded());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> signUpUser({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUserUseCase(user);
      emit(CredentialLoaded());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> resetPasswordUser({required String email}) async {
    emit(CredentialLoading());
    try {
      await resetPasswordUseCase(email: email);
      emit(CredentialLoaded());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
