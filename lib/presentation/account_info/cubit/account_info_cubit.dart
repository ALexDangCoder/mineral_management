import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'account_info_state.dart';

class AccountInfoCubit extends BaseCubit<AccountInfoState> {
  AccountInfoCubit(this._authRepository) : super(const AccountInfoState());

  final AuthRepository _authRepository;

  final ImagePicker _picker = ImagePicker();

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

  Future<void> pickAvatar() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      emit(
        state.copyWith(
          avatar: File(image.path),
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Không thể chọn ảnh',
        ),
      );
    }
  }
}
