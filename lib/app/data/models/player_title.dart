// To parse this JSON data, do
//
//     final playerTitleModel = playerTitleModelFromJson(jsonString);

import 'dart:convert';

PlayerTitleModel playerTitleModelFromJson(String str) =>
    PlayerTitleModel.fromJson(json.decode(str));

String playerTitleModelToJson(PlayerTitleModel data) =>
    json.encode(data.toJson());

class PlayerTitleModel {
  String? uuid;
  String? displayName;
  String? titleText;
  bool? isHiddenIfNotOwned;
  String? assetPath;

  PlayerTitleModel({
    this.uuid,
    this.displayName,
    this.titleText,
    this.isHiddenIfNotOwned,
    this.assetPath,
  });

  factory PlayerTitleModel.fromJson(Map<String, dynamic> json) =>
      PlayerTitleModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        titleText: json["titleText"],
        isHiddenIfNotOwned: json["isHiddenIfNotOwned"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "titleText": titleText,
        "isHiddenIfNotOwned": isHiddenIfNotOwned,
        "assetPath": assetPath,
      };
}
