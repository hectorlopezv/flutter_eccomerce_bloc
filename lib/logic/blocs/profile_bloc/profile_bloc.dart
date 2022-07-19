import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/user/user_repository.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/auth_bloc/auth_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final UserRepository _userRepository;
  StreamSubscription? _authSubscription;

  ProfileBloc({
    required AuthBloc authBloc,
    required UserRepository userRepository,
  })  : _authBloc = authBloc,
        _userRepository = userRepository,
        super(ProfileLoading()) {
    _authSubscription = _authBloc.stream.listen((state) {
      if (state.user != null) {
        add(LoadProfile(state.authUser));
      }
    });
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(event, Emitter<ProfileState> emit) async {
    try {
      if (event.authUser != null) {
        _userRepository.getUser(event.authUser.uid).listen((user) {
          add(UpdateProfile(user));
        });
      } else {
        emit(ProfileUnathenticated());
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _onUpdateProfile(event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoaded(user: event.user));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
