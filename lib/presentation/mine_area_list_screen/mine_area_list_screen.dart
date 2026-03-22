import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_area_list_screen/cubit'
    '/mining_area_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineAreaListScreen extends StatelessWidget {
  const MineAreaListScreen({super.key, this.region});

  final MineRegionModel? region;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MiningAreaCubit(
        injector.get(),
      )..fetchMineAreaList(region),
      child: AppScaffold(
        title: 'Danh sách khu mỏ\n${region?.regionName ?? ''}'.trim(),
        appBarColor: XelaColor.Gray12,
        body: const _MineAreaBody(),
      ),
    );
  }
}

class _MineAreaBody extends StatefulWidget {
  const _MineAreaBody({super.key});

  @override
  State<_MineAreaBody> createState() => _MineAreaBodyState();
}

class _MineAreaBodyState extends State<_MineAreaBody> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<MiningAreaCubit>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiningAreaCubit, MiningAreaState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            XelaTextField(
              textEditingController: _searchController,
              placeholder: 'Tìm kiếm khu mỏ...',
              leftIcon: const Icon(
                Icons.search,
                size: 20,
                color: XelaColor.Gray6,
              ),
              rightIcon: _searchController.text.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        _searchController.clear();
                        context.read<MiningAreaCubit>().searchMiningAreas('');
                      },
                      child: const Icon(
                        Icons.clear,
                      ),
                    )
                  : null,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                context.read<MiningAreaCubit>().searchMiningAreas(value);
              },
            ),
            const SizedBox(height: 12),
            _buildContentWithState(state),
          ],
        );
      },
    );
  }

  Widget _buildContentWithState(MiningAreaState state) {
    switch (state.screenStatus) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const Expanded(child: XkSkeletonList());
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không tìm thấy khu mỏ phù hợp.',
          onRetry: context.read<MiningAreaCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<MiningAreaCubit>().retry,
        );
      case MineScreenStatus.success:
        return Expanded(
          child: RefreshIndicator(
            onRefresh: context.read<MiningAreaCubit>().refresh,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: (state.mineAreaList?.length ?? 0) + 1,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, index) {
                if (index < (state.mineAreaList?.length ?? 0)) {
                  final mineArea = state.mineAreaList?[index];
                  return XkCard(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routers.mineDetail,
                        arguments: {'areaId': mineArea?.areaId},
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 22, color: XelaColor.Gray3),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            mineArea?.areaName ?? '',
                            style: XelaTextStyle.xelaBodyBold
                                .apply(color: XelaColor.Gray2),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: XelaColor.Gray5,
                        ),
                      ],
                    ),
                  );
                } else {
                  if (state.isLoadingMore == true) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return const SizedBox();
                  }
                }
              },
            ),
          ),
        );
    }
  }
}
