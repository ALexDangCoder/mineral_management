part of 'account_info_cubit.dart';

class AccountInfoState extends BaseState {
  final Map<String, dynamic>? userInfo;
  final BaseState? eventState;

  const AccountInfoState({
    this.userInfo,
    this.eventState,
  });

  AccountInfoState copyWith({
    BaseState? eventState,
    Map<String, dynamic>? userInfo,
  }) {
    return AccountInfoState(
      eventState: eventState ?? this.eventState,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object?> get props => [
        userInfo,
        eventState,
      ];
}
