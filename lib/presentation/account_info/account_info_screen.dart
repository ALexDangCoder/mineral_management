import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/presentation/account_info/cubit/account_info_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountInfoCubit(injector.get())..getUserInfo(),
      child: const _AccountInfoListener(),
    );
  }
}

class _AccountInfoListener extends StatelessWidget {
  const _AccountInfoListener();

  @override
  Widget build(BuildContext context) {
    return const _AccountInfoBody();
  }
}

class _AccountInfoBody extends StatefulWidget {
  const _AccountInfoBody();

  @override
  State<_AccountInfoBody> createState() => _AccountInfoBodyState();
}

class _AccountInfoBodyState extends State<_AccountInfoBody> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appS = AppS.of(context);
    return AppScaffold(
      body: BlocConsumer<AccountInfoCubit, AccountInfoState>(
        listener: (context, state) {
          _fullNameController.text = state.userInfoResponse?.name ?? '';
          _departmentController.text =
              state.userInfoResponse?.donVi?.tenDonVi ?? '';
          _phoneController.text = ''; // API doesn't return phone currently
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: XelaColor.Blue5.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: XelaUserAvatar(
                          initials: (state.userInfoResponse?.name ?? 'U')
                              .substring(0, 1)
                              .toUpperCase(),
                          background: XelaColor.Blue11,
                          foreground: XelaColor.Blue3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          image: state.avatar != null
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(state.avatar!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: GestureDetector(
                          onTap: () =>
                              context.read<AccountInfoCubit>().pickAvatar(),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: XelaColor.Blue5,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  state.userInfoResponse?.name ?? 'User Name',
                  style: XelaTextStyle.xelaHeadline.apply(
                    color: XelaColor.Gray2,
                    fontWeightDelta: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  state.userInfoResponse?.email ?? 'user@example.com',
                  style: XelaTextStyle.xelaSmallBody.apply(
                    color: XelaColor.Gray7,
                  ),
                ),
                const SizedBox(height: 32),

                // Personal Information Section
                XkCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const XkSectionHeader(title: 'Thông tin cá nhân'),
                      const SizedBox(height: 16),
                      XkLabelValueRow(
                        label: appS.username,
                        value: state.userInfoResponse?.username ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      XkLabelValueRow(
                        label: appS.name,
                        value: state.userInfoResponse?.name ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      XkLabelValueRow(
                        label: appS.department,
                        value: state.userInfoResponse?.donVi?.tenDonVi ?? 'N/A',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Account Actions Section
                XkCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const XkSectionHeader(title: 'Tài khoản'),
                      const SizedBox(height: 16),
                      XkActionButton(
                        text: appS.change_password,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routers.changePassword,
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      XelaButton(
                        onPressed: () {
                          context.read<AuthCubit>().logout();
                        },
                        text: appS.logout,
                        type: XelaButtonType.SECONDARY,
                        size: XelaButtonSize.SMALL,
                        background: Colors.white,
                        foregroundColor: XelaColor.Red4,
                        defaultBorderColor: XelaColor.Red11,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
