import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineBaseListScreen<T, C extends BaseListCubit<T>>
    extends StatelessWidget {
  const MineBaseListScreen({
    super.key,
    required this.title,
    this.searchPlaceholder,
    this.isShowSearchTField = true,
    required this.buildItem,
    required this.createCubit,
  });

  final String title;
  final String? searchPlaceholder;
  final bool? isShowSearchTField;
  final Widget Function(BuildContext context, T item) buildItem;
  final C Function(BuildContext context) createCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (_) => createCubit(context)..init(),
      child: AppScaffold(
        title: title,
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _BaseListBody<T, C>(
            searchPlaceholder: searchPlaceholder ?? 'Tìm kiếm',
            buildItem: buildItem,
            isShowSearchTField: isShowSearchTField ?? true),
      ),
    );
  }
}

class _BaseListBody<T, C extends BaseListCubit<T>> extends StatefulWidget {
  const _BaseListBody({
    super.key,
    required this.searchPlaceholder,
    required this.buildItem,
    required this.isShowSearchTField,
  });

  final String searchPlaceholder;
  final bool isShowSearchTField;
  final Widget Function(BuildContext context, T item) buildItem;

  @override
  State<_BaseListBody<T, C>> createState() => _BaseListBodyState<T, C>();
}

class _BaseListBodyState<T, C extends BaseListCubit<T>>
    extends State<_BaseListBody<T, C>> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<C>().loadMore();
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
    return Column(
      children: [
        if (widget.isShowSearchTField) ...[
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: XelaTextField(
              textEditingController: _searchController,
              placeholder: widget.searchPlaceholder,
              leftIcon: const Icon(
                Icons.search,
                size: 20,
                color: XelaColor.Gray6,
              ),
              rightIcon: _searchController.text.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        _searchController.clear();
                        context.read<C>().searchWithKey('');
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 18,
                        color: XelaColor.Gray7,
                      ),
                    )
                  : null,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                context.read<C>().searchWithKey(value);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
        Expanded(
          child: BlocBuilder<C, BaseListState<T>>(
            builder: (context, state) {
              switch (state.status) {
                case MineScreenStatus.initial:
                case MineScreenStatus.loading:
                  return const XkSkeletonList();
                case MineScreenStatus.empty:
                  return XkEmptyState(
                    message: 'Không tìm dữ liệu phù hợp.',
                    onRetry: context.read<C>().getList,
                  );

                case MineScreenStatus.failure:
                  return XkErrorState(
                    message: state.errorMessage ?? 'Đã xảy ra lỗi.',
                    onRetry: context.read<C>().getList,
                  );

                case MineScreenStatus.success:
                  final items = state.items ?? []; // luôn là List<T>
                  return RefreshIndicator(
                    onRefresh: context.read<C>().refresh,
                    child: ListView.separated(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: items.length + (state.isLoadingMore ? 1 : 0),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (_, index) {
                        return widget.buildItem(context, items[index]);
                      },
                    ),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
