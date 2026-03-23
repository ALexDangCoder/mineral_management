part of 'home_cubit.dart';

class HomeState extends BaseState {
  const HomeState({
    this.userInfoResponse,
    this.eventState = const InitState(),
  });

  final UserInfoResponse? userInfoResponse;
  final BaseState eventState;

  HomeState copyWith({
    UserInfoResponse? userInfoResponse,
    BaseState? eventState,
  }) {
    return HomeState(
      userInfoResponse: userInfoResponse ?? this.userInfoResponse,
      eventState: eventState ?? this.eventState,
    );
  }

  @override
  List<Object?> get props => [
        userInfoResponse,
        eventState,
      ];
}
