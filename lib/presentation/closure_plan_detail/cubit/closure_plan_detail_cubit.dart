import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'closure_plan_detail_state.dart';

class ClosurePlanDetailCubit
    extends BaseCubit<ClosurePlanDetailState> {
  ClosurePlanDetailCubit()
      : super(const ClosurePlanDetailState());

  Future<void> fetchDetail() async {
    emit(state.copyWith(eventState: const LoadingState()));

    await Future.delayed(const Duration(milliseconds: 300));

    emit(
      state.copyWith(
        eventState: const LoadedState(),
        data: const ClosurePlanDetailModel(
          code: 'DCM0000001',
          name: 'Đề án đóng cửa mỏ Mạo Khê',
          mine: 'Than',
          mineral: 'Than',
          owner: 'Công ty Than Mạo Khê',
          createdDate: '15/02/2023',
          approvedDate: '01/04/2023',
          duration: '2023-2025',
          progress: 0.45,
          estimateCost: 115000,
          approvedCost: null,
          status: 'Chờ duyệt',
          approvedBy: 'Bộ Tài nguyên & Môi trường',
          note: 'Đang thực hiện cải tạo môi trường',
        ),
      ),
    );
  }
}
