import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/auth/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignupCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignUpState.initial());

  void onUserChanged(User user) {
    emit(state.copyWith(user: user, status: SignUpStatus.initial));
  }

  void onPassWordChanged(String password) {
    emit(state.copyWith(password: password, status: SignUpStatus.initial));
  }

  Future<void> LoginWithCredentialas(BuildContext? context) async {
    if (state.isFormValid == false || state.status == SignUpStatus.submitting)
      return;
    emit(state.copyWith(status: SignUpStatus.submitting));

    try {
      var authUser = await _authRepository.signUp(
          user_1: state.user!, password: state.password);

      emit(state.copyWith(status: SignUpStatus.success, authUser: authUser));
      if (context != null) {
        Navigator.pushNamed(context, "/");
      }
    } catch (error) {
      rethrow;
    }
  }
}
