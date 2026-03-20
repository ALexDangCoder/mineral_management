import 'dart:convert';

class AuthEntity {
  final String accessToken;
  final String refreshToken;
  final DateTime accessExpireAt;
  final DateTime refreshExpireAt;
  final bool isFirstLogin;

  AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.accessExpireAt,
    required this.refreshExpireAt,
    required this.isFirstLogin,
  });

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'accessExpireAt': accessExpireAt.toIso8601String(),
    'refreshExpireAt': refreshExpireAt.toIso8601String(),
    'isFirstLogin': isFirstLogin,
  };

  factory AuthEntity.fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      accessExpireAt: DateTime.parse(json['accessExpireAt']),
      refreshExpireAt: DateTime.parse(json['refreshExpireAt']),
      isFirstLogin: json['isFirstLogin'],
    );
  }

  String toRawJson() => jsonEncode(toJson());

  factory AuthEntity.fromRawJson(String str) =>
      AuthEntity.fromJson(jsonDecode(str));
}