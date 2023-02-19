// To parse this JSON data, do
//
//     final loginResultModel = loginResultModelFromJson(jsonString);

import 'dart:convert';

LoginResultModel loginResultModelFromJson(String str) =>
    LoginResultModel.fromJson(json.decode(str));

String loginResultModelToJson(LoginResultModel data) =>
    json.encode(data.toJson());

class LoginResultModel {
  LoginResultModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  bool success;
  String expiresAt;
  String requestToken;

  factory LoginResultModel.fromJson(Map<String, dynamic> json) =>
      LoginResultModel(
        success: json["success"],
        expiresAt: json["expires_at"],
        requestToken: json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "expires_at": expiresAt,
        "request_token": requestToken,
      };
}
