import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mine_menu_state.dart';

class MineMenuCubit extends Cubit<MineMenuState> {
  MineMenuCubit() : super(const MineMenuState());

  Future<void> init() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      const items = <MineMenuItem>[
        MineMenuItem(
          id: MineMenuItemId.originalDocument,
          label: 'Tài liệu nguyên thủy',
        ),
        MineMenuItem(
          id: MineMenuItemId.geologicalReport,
          label: 'Báo cáo địa chất',
        ),
        MineMenuItem(
          id: MineMenuItemId.planOrProposal,
          label: 'Đề án/phương án',
        ),
        MineMenuItem(
          id: MineMenuItemId.resourceManagement,
          label: 'Quản trị tài nguyên',
        ),
        MineMenuItem(
          id: MineMenuItemId.miningProject,
          label: 'Dự án khai thác',
        ),
        MineMenuItem(
          id: MineMenuItemId.mineClosurePlan,
          label: 'Đề án đóng cửa mỏ',
        ),
      ];

      emit(
        state.copyWith(
          status:
              items.isEmpty ? MineScreenStatus.empty : MineScreenStatus.success,
          items: items,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Không thể tải danh mục vùng mỏ.',
        ),
      );
    }
  }

  Future<void> retry() async {
    await init();
  }
}

enum MineMenuItemId {
  originalDocument,
  geologicalReport,
  planOrProposal,
  resourceManagement,
  miningProject,
  mineClosurePlan,
}

class MineMenuItem extends Equatable {
  const MineMenuItem({
    required this.id,
    required this.label,
  });

  final MineMenuItemId id;
  final String label;

  @override
  List<Object?> get props => [id, label];
}
