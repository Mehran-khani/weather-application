// To parse this JSON data, do
//
//     final locations = locationsFromJson(jsonString);

import 'dart:convert';

List<Locations?>? locationsFromJson(String str) => json.decode(str) == null
    ? []
    : List<Locations?>.from(
        json.decode(str)!.map((x) => Locations.fromJson(x)));

String locationsToJson(List<Locations?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Locations {
  Locations({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  String? name;
  Map<String, String?>? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        name: json["name"],
        // localNames: Map.from(json["local_names"]!)
        // .map((k, v) => MapEntry<String, String?>(k, v)),
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "local_names": Map.from(localNames!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state,
      };
}
