part of 'auth_cubit.dart';

class AuthState extends BaseState {
  final AuthStatusEnum authStatus;
  final UserModel? user;

  const AuthState({this.authStatus = AuthStatusEnum.unknown, this.user});

  AuthState copyWith({
    AuthStatusEnum? authStatus,
    UserModel? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        authStatus,
        user,
      ];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class ChangingPassLoading extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class AuthenticatedError extends AuthState {}

class SessionExpired extends AuthState {}

class ChangedPasswordSuccess extends AuthState {}

class ChangedPassError extends AuthState {}
