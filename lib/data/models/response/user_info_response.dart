import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_response.freezed.dart';
part 'user_info_response.g.dart';

@freezed
abstract class UserInfoResponse with _$UserInfoResponse {
  const factory UserInfoResponse({
    int? id,
    String? username,
    String? firstname,
    String? lastname,
    String? name,
    String? email,
    Role? role,
    DonVi? donVi,
  }) = _UserInfoResponse;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}

@freezed
abstract class Role with _$Role {
  const factory Role({
    int? id,
    String? name,
    List<Rule>? rules,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@freezed
abstract class Rule with _$Rule {
  const factory Rule({
    int? ruleId,
    int? roleId,
    int? moduleId,
    int? isView,
    int? isAdd,
    int? isEdit,
    int? isDelete,
    int? isDownload,
    int? isApprove,
    String? name,
    String? url,
    int? pid,
    String? pathId,
    int? ordinal,
    String? icon,
    int? isViewMap,
    int? isEditMap,
    String? categoryId,
    String? module,
    String? idKhumo,
  }) = _Rule;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
}

@freezed
abstract class DonVi with _$DonVi {
  const factory DonVi({
    String? maDonVi,
    String? tenDonVi,
    String? tenVietTat,
    String? maDonViCha,
    String? tenDonViCha,
    String? idLoaiDonVi,
    List<DonViRole>? role,
  }) = _DonVi;

  factory DonVi.fromJson(Map<String, dynamic> json) => _$DonViFromJson(json);
}

@freezed
abstract class DonViRole with _$DonViRole {
  const factory DonViRole({
    int? id,
    String? maDonViId,
    String? idVungMo,
    String? tenVungMo,
    String? idKhuMo,
    String? tenKhuMo,
    int? allow,
    String? makhoangsan,
  }) = _DonViRole;

  factory DonViRole.fromJson(Map<String, dynamic> json) => _$DonViRoleFromJson(json);
}
