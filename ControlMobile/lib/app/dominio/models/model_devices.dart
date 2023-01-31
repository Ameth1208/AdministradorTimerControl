// To parse this JSON data, do
//
//     final modelDevices = modelDevicesFromMap(jsonString);

import 'dart:convert';

class ModelDevices {
  ModelDevices({
    required this.nameDevices,
    required this.numberIp,
  });

  final String nameDevices;
  final String numberIp;

  factory ModelDevices.fromJson(String str) =>
      ModelDevices.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDevices.fromMap(Map<String, dynamic> json) => ModelDevices(
        nameDevices: json["nameDevices"],
        numberIp: json["numberIp"],
      );

  Map<String, dynamic> toMap() => {
        "nameDevices": nameDevices,
        "numberIp": numberIp,
      };
}
