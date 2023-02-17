// To parse this JSON data, do
//
//     final reqToken = reqTokenFromJson(jsonString);

import 'dart:convert';

ReqToken reqTokenFromJson(String str) => ReqToken.fromJson(json.decode(str));

String reqTokenToJson(ReqToken data) => json.encode(data.toJson());

class ReqToken {
  ReqToken({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  bool success;
  String expiresAt;
  String requestToken;

  factory ReqToken.fromJson(Map<String, dynamic> json) => ReqToken(
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
