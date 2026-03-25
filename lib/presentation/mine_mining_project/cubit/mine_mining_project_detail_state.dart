part of 'mine_mining_project_detail_cubit.dart';

class MineMiningProjectDetailState extends Equatable {
  const MineMiningProjectDetailState({
    this.status = MineScreenStatus.initial,
    this.miningProject,
    this.errorMessage,
    this.id,
  });

  final MineScreenStatus status;
  final MiningProjectModel? miningProject;
  final String? errorMessage;
  final String? id;

  MineMiningProjectDetailState copyWith({
    MineScreenStatus? status,
    MiningProjectModel? miningProject,
    String? errorMessage,
    String? id,
  }) {
    return MineMiningProjectDetailState(
      status: status ?? this.status,
      miningProject: miningProject ?? this.miningProject,
      errorMessage: errorMessage ?? this.errorMessage,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [status, miningProject, errorMessage, id];
}
