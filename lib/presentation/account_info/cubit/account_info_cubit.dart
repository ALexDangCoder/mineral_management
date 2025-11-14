import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';
import 'package:meta/meta.dart';

part 'account_info_state.dart';

class AccountInfoCubit extends BaseCubit<AccountInfoState> {
  AccountInfoCubit(this._authRepository) : super(const AccountInfoState());

  final AuthRepository _authRepository;

  Future<void> getUserInfo() async {
    final userData = await _authRepository.getSavedUserInfo() ?? {};
log('USER DATA ${userData}');
    final userInfo = UserModel.fromJson(userData);
    emit(
      state.copyWith(
        userInfo: userInfo,
        eventState: const LoadedState(),
      ),
    );
  }
}
