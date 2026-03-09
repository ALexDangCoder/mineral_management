part of 'change_password_cubit.dart';

class ChangePasswordState extends BaseState {
  final BaseState? validationInput;
  final BaseState? eventState;

  const ChangePasswordState({
    this.validationInput,
    this.eventState,
  });

  ChangePasswordState copyWith({
    BaseState? validationInput,
    BaseState? eventState,
  }) {
    return ChangePasswordState(
      validationInput: validationInput ?? this.validationInput,
      eventState: eventState ?? this.eventState,
    );
  }

  @override
  List<Object?> get props => [
        validationInput,
        eventState,
      ];
}
