// To parse this JSON data, do
//
//     final playerCardModel = playerCardModelFromJson(jsonString);

import 'dart:convert';

PlayerCardModel playerCardModelFromJson(String str) =>
    PlayerCardModel.fromJson(json.decode(str));

String playerCardModelToJson(PlayerCardModel data) =>
    json.encode(data.toJson());

class PlayerCardModel {
  String? uuid;
  String? displayName;
  bool? isHiddenIfNotOwned;
  dynamic themeUuid;
  String? displayIcon;
  String? smallArt;
  String? wideArt;
  String? largeArt;
  String? assetPath;

  PlayerCardModel({
    this.uuid,
    this.displayName,
    this.isHiddenIfNotOwned,
    this.themeUuid,
    this.displayIcon,
    this.smallArt,
    this.wideArt,
    this.largeArt,
    this.assetPath,
  });

  factory PlayerCardModel.fromJson(Map<String, dynamic> json) =>
      PlayerCardModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        isHiddenIfNotOwned: json["isHiddenIfNotOwned"],
        themeUuid: json["themeUuid"],
        displayIcon: json["displayIcon"],
        smallArt: json["smallArt"],
        wideArt: json["wideArt"],
        largeArt: json["largeArt"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "isHiddenIfNotOwned": isHiddenIfNotOwned,
        "themeUuid": themeUuid,
        "displayIcon": displayIcon,
        "smallArt": smallArt,
        "wideArt": wideArt,
        "largeArt": largeArt,
        "assetPath": assetPath,
      };
}
