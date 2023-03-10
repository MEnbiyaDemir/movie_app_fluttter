// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.avatar,
    required this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    required this.includeAdult,
    required this.username,
  });

  Avatar avatar;
  int id;
  String? iso6391;
  String? iso31661;
  String? name;
  bool includeAdult;
  String username;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        avatar: Avatar.fromJson(json["avatar"]),
        id: json["id"],
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        includeAdult: json["include_adult"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar.toJson(),
        "id": id,
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "include_adult": includeAdult,
        "username": username,
      };
}

class Avatar {
  Avatar({
    required this.gravatar,
    required this.tmdb,
  });

  Gravatar gravatar;
  Tmdb tmdb;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        gravatar: Gravatar.fromJson(json["gravatar"]),
        tmdb: Tmdb.fromJson(json["tmdb"]),
      );

  Map<String, dynamic> toJson() => {
        "gravatar": gravatar.toJson(),
        "tmdb": tmdb.toJson(),
      };
}

class Gravatar {
  Gravatar({
    this.hash,
  });

  String? hash;

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
      };
}

class Tmdb {
  Tmdb({
    this.avatarPath,
  });

  String? avatarPath;

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
        avatarPath: json["avatar_path"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_path": avatarPath,
      };
}
