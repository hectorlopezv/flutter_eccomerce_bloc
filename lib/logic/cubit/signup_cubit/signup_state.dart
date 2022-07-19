part of 'signup_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final String password;
  final SignUpStatus status;

  final auth.User? authUser;
  final User? user;

  bool get isFormValid => user!.email.isNotEmpty && password.isNotEmpty;

  @override
  bool get stringify => true;

  const SignUpState({
    required this.password,
    required this.status,
    this.authUser,
    this.user,
  });

  @override
  List<Object?> get props => [
        password,
        status,
        user,
        authUser,
      ];

  factory SignUpState.initial() {
    return SignUpState(
      authUser: null,
      password: "",
      status: SignUpStatus.initial,
      user: User(),
    );
  }

  SignUpState copyWith({
    String? email,
    String? password,
    SignUpStatus? status,
    auth.User? authUser,
    User? user,
  }) {
    return SignUpState(
      password: password ?? this.password,
      status: status ?? this.status,
      user: user ?? this.user,
      authUser: authUser ?? this.authUser,
    );
  }
}
