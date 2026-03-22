import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_region_list_screen/cubit'
    '/mine_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineListScreen extends StatelessWidget {
  const MineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MineListCubit(
        injector.get(),
      )..init(),
      child: const AppScaffold(
        title: 'Danh sách Vùng mỏ',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _MineListBody(),
      ),
    );
  }
}

class _MineListBody extends StatefulWidget {
  const _MineListBody();

  @override
  State<_MineListBody> createState() => _MineListBodyState();
}

class _MineListBodyState extends State<_MineListBody> {
  final _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final cubit = context.read<MineListCubit>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MineListCubit, MineListState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          XelaTextField(
            textEditingController: _searchController,
            placeholder: 'Tìm kiếm vùng mỏ...',
            leftIcon: const Icon(
              Icons.search,
              size: 20,
              color: XelaColor.Gray6,
            ),
            rightIcon: _searchController.text.isNotEmpty
                ? InkWell(
                    onTap: () {
                      _searchController.clear();
                      context.read<MineListCubit>().searchMineRegions('');
                    },
                    child: const Icon(
                      Icons.clear,
                    ),
                  )
                : null,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              context.read<MineListCubit>().searchMineRegions(value);
            },
          ),
          const SizedBox(height: 12),
          _buildContent(context, state),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, MineListState state) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const Expanded(child: XkSkeletonList());
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không tìm thấy vùng mỏ phù hợp.',
          onRetry: context.read<MineListCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<MineListCubit>().retry,
        );
      case MineScreenStatus.success:
        return Expanded(
          child: RefreshIndicator(
            onRefresh: context.read<MineListCubit>().refresh,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: (state.mineRegions?.length ?? 0) + 1,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, index) {
                if (index < (state.mineRegions?.length ?? 0)) {
                  final region = state.mineRegions?[index];
                  return XkCard(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routers.mineAreaList,
                        arguments: region,
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.map_outlined,
                            size: 22, color: XelaColor.Gray3),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            region?.regionName ?? '',
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
