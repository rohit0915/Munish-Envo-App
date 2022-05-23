// To parse this JSON data, do
//
//     final placesModel = placesModelFromJson(jsonString);

import 'dart:convert';

List<PlacesModel> placesModelFromJson(String str) => List<PlacesModel>.from(
    json.decode(str).map((x) => PlacesModel.fromJson(x)));

String placesModelToJson(List<PlacesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlacesModel {
  PlacesModel({
    required this.formattedAddress,
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.name,
    this.photos,
    required this.placeId,
    required this.reference,
    this.types,
  });

  String formattedAddress;
  Geometry geometry;
  String icon;
  String iconBackgroundColor;
  String iconMaskBaseUri;
  String name;
  List<Photo>? photos;
  String placeId;
  String reference;
  List<String>? types;

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        iconBackgroundColor: json["icon_background_color"],
        iconMaskBaseUri: json["icon_mask_base_uri"],
        name: json["name"],
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        placeId: json["place_id"],
        reference: json["reference"],
        types:json["types"]==null?null :List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress,
        "geometry": geometry.toJson(),
        "icon": icon,
        "icon_background_color": iconBackgroundColor,
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
        "place_id": placeId,
        "reference": reference,
        "types": List<dynamic>.from(types!.map((x) => x)),
      };
}

class Geometry {
  Geometry({
    required this.location,
    required this.viewport,
  });

  LocationModel location;
  Viewport viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: LocationModel.fromJson(json["location"]),
        viewport: Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "viewport": viewport.toJson(),
      };
}

class LocationModel {
  LocationModel({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Viewport {
  Viewport({
    required this.northeast,
    required this.southwest,
  });

  LocationModel northeast;
  LocationModel southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: LocationModel.fromJson(json["northeast"]),
        southwest: LocationModel.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}

class Photo {
  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions:
            List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
      };
}
