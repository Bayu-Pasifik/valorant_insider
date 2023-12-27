// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

import 'dart:convert';

AgentModel agentModelFromJson(String str) => AgentModel.fromJson(json.decode(str));

String agentModelToJson(AgentModel data) => json.encode(data.toJson());

class AgentModel {
    String? uuid;
    String? displayName;
    String? description;
    String? developerName;
    dynamic characterTags;
    String? displayIcon;
    String? displayIconSmall;
    String? bustPortrait;
    String? fullPortrait;
    String? fullPortraitV2;
    String? killfeedPortrait;
    String? background;
    List<String>? backgroundGradientColors;
    String? assetPath;
    bool? isFullPortraitRightFacing;
    bool? isPlayableCharacter;
    bool? isAvailableForTest;
    bool? isBaseContent;
    Role? role;
    dynamic recruitmentData;
    List<Ability>? abilities;
    dynamic voiceLine;

    AgentModel({
        this.uuid,
        this.displayName,
        this.description,
        this.developerName,
        this.characterTags,
        this.displayIcon,
        this.displayIconSmall,
        this.bustPortrait,
        this.fullPortrait,
        this.fullPortraitV2,
        this.killfeedPortrait,
        this.background,
        this.backgroundGradientColors,
        this.assetPath,
        this.isFullPortraitRightFacing,
        this.isPlayableCharacter,
        this.isAvailableForTest,
        this.isBaseContent,
        this.role,
        this.recruitmentData,
        this.abilities,
        this.voiceLine,
    });

    factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        developerName: json["developerName"],
        characterTags: json["characterTags"],
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        fullPortraitV2: json["fullPortraitV2"],
        killfeedPortrait: json["killfeedPortrait"],
        background: json["background"],
        backgroundGradientColors: json["backgroundGradientColors"] == null ? [] : List<String>.from(json["backgroundGradientColors"]!.map((x) => x)),
        assetPath: json["assetPath"],
        isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
        isPlayableCharacter: json["isPlayableCharacter"],
        isAvailableForTest: json["isAvailableForTest"],
        isBaseContent: json["isBaseContent"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        recruitmentData: json["recruitmentData"],
        abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromJson(x))),
        voiceLine: json["voiceLine"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "characterTags": characterTags,
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "fullPortraitV2": fullPortraitV2,
        "killfeedPortrait": killfeedPortrait,
        "background": background,
        "backgroundGradientColors": backgroundGradientColors == null ? [] : List<dynamic>.from(backgroundGradientColors!.map((x) => x)),
        "assetPath": assetPath,
        "isFullPortraitRightFacing": isFullPortraitRightFacing,
        "isPlayableCharacter": isPlayableCharacter,
        "isAvailableForTest": isAvailableForTest,
        "isBaseContent": isBaseContent,
        "role": role?.toJson(),
        "recruitmentData": recruitmentData,
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "voiceLine": voiceLine,
    };
}

class Ability {
    String? slot;
    String? displayName;
    String? description;
    String? displayIcon;

    Ability({
        this.slot,
        this.displayName,
        this.description,
        this.displayIcon,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json["slot"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
    };
}

class Role {
    String? uuid;
    String? displayName;
    String? description;
    String? displayIcon;
    String? assetPath;

    Role({
        this.uuid,
        this.displayName,
        this.description,
        this.displayIcon,
        this.assetPath,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
    };
}
