part of 'login_cubit.dart';

class LoginState extends BaseState {
  final BaseState? eventState;

  const LoginState({
    this.eventState,
  });

  LoginState copyWith({
    BaseState? eventState,
  }) {
    return LoginState(
      eventState: eventState ?? this.eventState,
    );
  }

  @override
  List<Object?> get props => [
        eventState,
      ];
}
