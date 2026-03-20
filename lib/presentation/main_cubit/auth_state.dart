part of 'auth_cubit.dart';

class AuthState extends BaseState {
  final AuthStatusEnum authStatus;
  final AuthEntity? authEntity;
  final bool isDidCheckAuth;

  const AuthState({
    this.authStatus = AuthStatusEnum.unknown,
    this.authEntity,
    this.isDidCheckAuth = false,
  });

  AuthState copyWith({
    AuthStatusEnum? authStatus,
    AuthEntity? authEntity,
    bool? isDidCheckAuth,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      authEntity: authEntity ?? this.authEntity,
      isDidCheckAuth: isDidCheckAuth ?? this.isDidCheckAuth,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        authEntity,
        isDidCheckAuth,
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
