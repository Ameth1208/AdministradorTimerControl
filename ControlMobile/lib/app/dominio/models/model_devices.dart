// To parse this JSON data, do
//
//     final modelDevices = modelDevicesFromMap(jsonString);

import 'dart:convert';

class ModelDevices {
  ModelDevices({
    required this.type,
    required this.name,
    required this.numberIp,
    required this.state,
  });

  final int type;
  final String name;
  final String numberIp;
  final int state;

  factory ModelDevices.fromJson(String str) =>
      ModelDevices.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDevices.fromMap(Map<String, dynamic> json) => ModelDevices(
        type: json["type"],
        name: json["name"],
        numberIp: json["numberIp"],
        state: json["state"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "name": name,
        "numberIp": numberIp,
        "state": state,
      };
}
