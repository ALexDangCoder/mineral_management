part of 'change_password_cubit.dart';

class ChangePasswordState extends BaseState {
  final BaseState? validationInput;

  const ChangePasswordState({
    this.validationInput,
  });

  ChangePasswordState copyWith({BaseState? validationInput}) {
    return ChangePasswordState(
        validationInput: validationInput ?? this.validationInput);
  }

  @override
  List<Object?> get props => [
        validationInput,
      ];
}
