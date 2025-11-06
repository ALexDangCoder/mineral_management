part of 'auth_cubit.dart';

abstract class AuthState extends BaseState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class ChangingPassLoading extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class ChangedPasswordSuccess extends AuthState {}
