part of 'account_info_cubit.dart';

class AccountInfoState extends BaseState {
  final UserInfoResponse? userInfoResponse;
  final BaseState? eventState;
  final File? avatar;
  final bool isLoading;
  final String? error;

  const AccountInfoState({
    this.userInfoResponse,
    this.eventState,
    this.avatar,
    this.isLoading = false,
    this.error,
  });

  AccountInfoState copyWith({
    BaseState? eventState,
    UserInfoResponse? userInfoResponse,
    File? avatar,
    bool? isLoading,
    String? error,
  }) {
    return AccountInfoState(
      eventState: eventState ?? this.eventState,
      userInfoResponse: userInfoResponse ?? this.userInfoResponse,
      avatar: avatar ?? this.avatar,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        userInfoResponse,
        eventState,
        avatar,
        isLoading,
        error,
      ];
}
