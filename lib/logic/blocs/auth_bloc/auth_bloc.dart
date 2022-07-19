import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/auth/auth_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/user/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanges);
    _authUserSubscription = _authRepository.user.listen((authUser) {
      if (authUser != null) {
        _userSubscription =
            _userRepository.getUser(authUser.uid).listen((user) {
          add(AuthUserChanged(authUser: authUser, user: user));
        });
      } else {
        add(AuthUserChanged(authUser: authUser));
      }
    });
  }

  Future<void> _onAuthUserChanges(
      AuthUserChanged event, Emitter<AuthState> emit) async {
    try {
      event.authUser != null
          ? emit(
              AuthState.authenticated(
                  authUser: event.authUser!, user: event.user!),
            )
          : emit(
              AuthState.unauthenticated(),
            );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    await _authUserSubscription?.cancel();
    await _userSubscription?.cancel();
    super.close();
  }
}
