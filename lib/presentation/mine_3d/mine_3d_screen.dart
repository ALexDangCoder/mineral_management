import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/data/repositories/mine_repositories.dart';
import 'package:bnv_opendata/presentation/mine_3d/cubit/mine_3d_state.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'cubit/mine_3d_cubit.dart';

class Mine3DScreen extends StatelessWidget {
  const Mine3DScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Mine3DCubit(MineRepository())..loadMine3DModel(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<Mine3DCubit, Mine3DState>(
            builder: (context, state) {
              if (state is Mine3DLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is Mine3DLoaded) {
                // Nhận arguments từ các màn hình khác
                final args = ModalRoute.of(context)?.settings.arguments;
                String? projectName;
                if (args is Map) {
                  projectName = args['projectName'] as String?;
                } else if (args != null) {
                  // Nếu args là MineModel
                  projectName = state.mine.name;
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        RawMaterialButton(
                          elevation: 0,
                          focusElevation: 2,
                          highlightElevation: 0,
                          fillColor: Colors.transparent,
                          hoverElevation: 0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          constraints: const BoxConstraints(),
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 20,
                              color: XelaColor.Gray2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Mô hình 3D",
                            style: XelaTextStyle.xelaHeadline.apply(
                              color: XelaColor.Gray2,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Text(
                      state.mine.name,
                      style: XelaTextStyle.xelaSubheadline,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ModelViewer(
                          src: state.mine.modelUrl,
                          ar: true,
                          autoRotate: true,
                          cameraControls: true,
                        ),
                      ),
                    ),
                    // Button "Chi tiết dự án"
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: XelaButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routers.projectDetail,
                            arguments: {
                              'projectName': projectName ?? state.mine.name,
                              'fromMine3D': true,
                            },
                          );
                        },
                        text: 'Chi tiết dự án',
                        background: AppTheme.getInstance().primaryColor(),
                      ),
                    ),
                  ],
                );
              }

              if (state is Mine3DError) {
                return Center(
                  child: Text(
                    'Lỗi: ${state.message}',
                    style: XelaTextStyle.xelaSubheadline,
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
