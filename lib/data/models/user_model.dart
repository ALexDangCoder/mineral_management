// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//
// String userModelToJson(UserModel data) => json.encode(data.toJson());
//
// class UserModel {
//   String? username;
//   String? fullName;
//   String? position;
//   String? phone;
//   String? email;
//
//   UserModel({
//     this.username,
//     this.fullName,
//     this.position,
//     this.phone,
//     this.email,
//   });
//
//   UserModel copyWith({
//     String? username,
//     String? fullName,
//     String? position,
//     String? phone,
//     String? email,
//   }) =>
//       UserModel(
//         username: username ?? this.username,
//         fullName: fullName ?? this.fullName,
//         position: position ?? this.position,
//         phone: phone ?? this.phone,
//         email: email ?? this.email,
//       );
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     username: json['username'],
//     fullName: json['fullName'],
//     position: json['position'],
//     phone: json['phone'],
//     email: json['email'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'username': username,
//     'fullName': fullName,
//     'position': position,
//     'phone': phone,
//     'email': email,
//   };
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    String? username,
    String? fullName,
    String? position,
    String? phone,
    String? email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
sealed class DocInfo with _$DocInfo {
  const factory DocInfo({
    String? label,
    String? value,
  }) = _DocInfo;

  factory DocInfo.fromJson(Map<String, dynamic> json) => _$DocInfoFromJson(json);
}
