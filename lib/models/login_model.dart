// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.success,
    this.failure,
    this.statusCode,
    this.statusMessage,
    this.sessionId,
  });

  bool success;
  bool? failure;
  int? statusCode;
  String? statusMessage;
  String? sessionId;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    failure: json["failure"],
    statusCode: json["status_code"],
    statusMessage: json["status_message"],
    sessionId: json["session_id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "failure": failure,
    "status_code": statusCode,
    "status_message": statusMessage,
    "session_id": sessionId,
  };
}
