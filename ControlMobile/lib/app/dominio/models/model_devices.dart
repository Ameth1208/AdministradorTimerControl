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
    required this.changeTime,
    required this.horaStart,
    required this.horaEnd,
    required this.id,
  });

  final String type;
  final String name;
  final String numberIp;
  final int state;
  final int colorCard;
  final int time;
  final int changeTime;
  final String horaStart;
  final String horaEnd;
  final String id;

  ModelDevices copyWith({
    String? type,
    String? name,
    String? numberIp,
    int? state,
    int? colorCard,
    int? time,
    int? changeTime,
    String? horaStart,
    String? horaEnd,
    String? id,
  }) =>
      ModelDevices(
        type: type ?? this.type,
        name: name ?? this.name,
        numberIp: numberIp ?? this.numberIp,
        state: state ?? this.state,
        colorCard: colorCard ?? this.colorCard,
        time: time ?? this.time,
        changeTime: changeTime ?? this.changeTime,
        horaStart: horaStart ?? this.horaStart,
        horaEnd: horaEnd ?? this.horaEnd,
        id: id ?? this.id,
      );

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
        changeTime: json["changeTime"],
        horaStart: json["horaStart"],
        horaEnd: json["horaEnd"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "name": name,
        "numberIp": numberIp,
        "state": state,
        "colorCard": colorCard,
        "time": time,
        "changeTime": changeTime,
        "horaStart": horaStart,
        "horaEnd": horaEnd,
        "id": id,
      };
}
