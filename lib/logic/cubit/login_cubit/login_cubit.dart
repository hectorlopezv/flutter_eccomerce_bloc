import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/auth/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(LoginState.initial());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email, status: LoginStatus.initial));
  }

  void onPassWordChanged(String password) {
    emit(state.copyWith(password: password, status: LoginStatus.initial));
  }

  Future<void> LoginWithCredentialas(BuildContext? context) async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));

    try {
      await _authRepository.signIn(
          email: state.email, password: state.password);

      emit(state.copyWith(status: LoginStatus.success));
      if (context != null) {
        Navigator.pushNamed(context, "/");
      }
    } catch (error) {
      rethrow;
    }
  }
}
