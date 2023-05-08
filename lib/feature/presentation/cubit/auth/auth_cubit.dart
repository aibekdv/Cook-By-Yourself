import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cook_by_yourself/feature/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RefreshTokenUseCase refreshTokenUseCase;
  final IsSignInUseCase isSignInUseCase;
  final SignOutUserCase signOutUserCase;

  AuthCubit({
    required this.refreshTokenUseCase,
    required this.isSignInUseCase,
    required this.signOutUserCase,
  }) : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    emit(AuthLoading());
    await refreshTokenUseCase.call();
    bool isSignIn = await isSignInUseCase();
    try {
      if (isSignIn) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    emit(AuthLoading());
    bool isSignIn = await isSignInUseCase();
    try {
      if (isSignIn) {
        emit(Authenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUserCase();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
