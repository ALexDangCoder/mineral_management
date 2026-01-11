part of 'account_info_cubit.dart';

class AccountInfoState extends BaseState {
  final UserModel? userInfo;
  final BaseState? eventState;
  final File? avatar;
  final bool isLoading;
  final String? error;

  const AccountInfoState({
    this.userInfo,
    this.eventState,
    this.avatar,
    this.isLoading = false,
    this.error,
  });

  AccountInfoState copyWith({
    BaseState? eventState,
    UserModel? userInfo,
    File? avatar,
    bool? isLoading,
    String? error,
  }) {
    return AccountInfoState(
      eventState: eventState ?? this.eventState,
      userInfo: userInfo ?? this.userInfo,
      avatar: avatar ?? this.avatar,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        userInfo,
        eventState,
        avatar,
        isLoading,
        error,
      ];
}
