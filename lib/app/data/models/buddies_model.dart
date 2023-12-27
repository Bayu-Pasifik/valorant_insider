// To parse this JSON data, do
//
//     final buddiesModel = buddiesModelFromJson(jsonString);

import 'dart:convert';

BuddiesModel buddiesModelFromJson(String str) => BuddiesModel.fromJson(json.decode(str));

String buddiesModelToJson(BuddiesModel data) => json.encode(data.toJson());

class BuddiesModel {
    String? uuid;
    String? displayName;
    bool? isHiddenIfNotOwned;
    dynamic themeUuid;
    String? displayIcon;
    String? assetPath;
    List<Level>? levels;

    BuddiesModel({
        this.uuid,
        this.displayName,
        this.isHiddenIfNotOwned,
        this.themeUuid,
        this.displayIcon,
        this.assetPath,
        this.levels,
    });

    factory BuddiesModel.fromJson(Map<String, dynamic> json) => BuddiesModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        isHiddenIfNotOwned: json["isHiddenIfNotOwned"],
        themeUuid: json["themeUuid"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
        levels: json["levels"] == null ? [] : List<Level>.from(json["levels"]!.map((x) => Level.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "isHiddenIfNotOwned": isHiddenIfNotOwned,
        "themeUuid": themeUuid,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
        "levels": levels == null ? [] : List<dynamic>.from(levels!.map((x) => x.toJson())),
    };
}

class Level {
    String? uuid;
    int? charmLevel;
    bool? hideIfNotOwned;
    String? displayName;
    String? displayIcon;
    String? assetPath;

    Level({
        this.uuid,
        this.charmLevel,
        this.hideIfNotOwned,
        this.displayName,
        this.displayIcon,
        this.assetPath,
    });

    factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        charmLevel: json["charmLevel"],
        hideIfNotOwned: json["hideIfNotOwned"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "charmLevel": charmLevel,
        "hideIfNotOwned": hideIfNotOwned,
        "displayName": displayName,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
    };
}
