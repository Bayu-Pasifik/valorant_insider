// To parse this JSON data, do
//
//     final mapModel = mapModelFromJson(jsonString);

import 'dart:convert';

MapModel mapModelFromJson(String str) => MapModel.fromJson(json.decode(str));

String mapModelToJson(MapModel data) => json.encode(data.toJson());

class MapModel {
    String? uuid;
    String? displayName;
    String? narrativeDescription;
    String? tacticalDescription;
    String? coordinates;
    String? displayIcon;
    String? listViewIcon;
    String? splash;
    String? assetPath;
    String? mapUrl;
    double? xMultiplier;
    double? yMultiplier;
    double? xScalarToAdd;
    double? yScalarToAdd;
    List<Callout>? callouts;

    MapModel({
        this.uuid,
        this.displayName,
        this.narrativeDescription,
        this.tacticalDescription,
        this.coordinates,
        this.displayIcon,
        this.listViewIcon,
        this.splash,
        this.assetPath,
        this.mapUrl,
        this.xMultiplier,
        this.yMultiplier,
        this.xScalarToAdd,
        this.yScalarToAdd,
        this.callouts,
    });

    factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        narrativeDescription: json["narrativeDescription"],
        tacticalDescription: json["tacticalDescription"],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: json["callouts"] == null ? [] : List<Callout>.from(json["callouts"]!.map((x) => Callout.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "narrativeDescription": narrativeDescription,
        "tacticalDescription": tacticalDescription,
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null ? [] : List<dynamic>.from(callouts!.map((x) => x.toJson())),
    };
}

class Callout {
    String? regionName;
    String? superRegionName;
    Location? location;

    Callout({
        this.regionName,
        this.superRegionName,
        this.location,
    });

    factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: json["superRegionName"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionName,
        "location": location?.toJson(),
    };
}

class Location {
    double? x;
    double? y;

    Location({
        this.x,
        this.y,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}
