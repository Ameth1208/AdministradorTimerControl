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
    required this.colorCard,
    required this.time,
  });

  final String type;
  final String name;
  final String numberIp;
  final int state;
  final int colorCard;
  final int time;

  factory ModelDevices.fromJson(String str) =>
      ModelDevices.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDevices.fromMap(Map<String, dynamic> json) => ModelDevices(
        type: json["type"],
        name: json["name"],
        numberIp: json["numberIp"],
        state: json["state"],
        colorCard: json["colorCard"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "name": name,
        "numberIp": numberIp,
        "state": state,
        "colorCard": colorCard,
        "time": time,
      };
}
