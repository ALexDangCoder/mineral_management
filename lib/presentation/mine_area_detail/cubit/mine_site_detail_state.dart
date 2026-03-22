part of 'mine_site_detail_cubit.dart';

class MineSiteDetailState extends Equatable {
  const MineSiteDetailState({
    this.status = MineScreenStatus.initial,
    this.areaId = '',
    this.mineAreaModel,
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String areaId;
  final MineAreaModel? mineAreaModel;
  final String? errorMessage;

  MineSiteDetailState copyWith({
    MineScreenStatus? status,
    String? areaId,
    MineAreaModel? mineAreaModel,
    String? errorMessage,
  }) {
    return MineSiteDetailState(
      status: status ?? this.status,
      areaId: areaId ?? this.areaId,
      mineAreaModel: mineAreaModel ?? this.mineAreaModel,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        areaId,
        mineAreaModel,
        errorMessage,
      ];
}
