import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timer_control/app/dominio/data/data_glogal.dart';
import 'package:timer_control/app/dominio/models/model_devices.dart';
import 'package:timer_control/app/ui/helpers/custom_assets.dart';
import 'package:timer_control/app/ui/helpers/custom_colors.dart';

///CONTROLLER ANDROID
class AddDevicesController extends ChangeNotifier {
  AddDevicesController() {
    relog = 10;
  }

  PageController pageController = PageController();

  TextEditingController name = TextEditingController();
  TextEditingController numberIp = TextEditingController();

  //List Map
  final List<Map<String, dynamic>> _listMap = [];
  List<Map<String, dynamic>> get listMap => _listMap;

  ///Lista Modelo
  List<ModelDevices> _listDevices = [];
  List<ModelDevices> get listDevices => _listDevices;
  set listDevices(List<ModelDevices> listDevices) {
    _listDevices = listDevices;
    notifyListeners();
  }

  void onState(int i, int t) async {
    final local = LocalStorage();
    final value = await local.get();
    final id = listDevices[i].id;
    final isValue = value?.keys.contains(id);
    value![id] = listDevices[i].copyWith(state: t).toMap();
    local.save(value);

    notifyListeners();
  }

  ///[Position Image]tim
  int _type = 0;
  int get type => _type;
  set type(int type) {
    _type = type;
    notifyListeners();
  }

  ///[Añadir dispositivo]
  void onAdd(int p) async {
    final id = (DateTime.now().toIso8601String());
    final model = ModelDevices(
      name: name.text,
      numberIp: numberIp.text,
      state: 0,
      type: listImageDevices[p],
      colorCard: Random().nextInt(listCardColor.length),

      ///time minutos
      time: 600,
      changeTime: 600,

      ///
      horaStart: "00:00:00",
      horaEnd: "00:00:00",
      id: id,
    );

    listDevices.add(model);
    Map<String, dynamic> map = {};

    _listMap.add(model.toMap());
    final local = LocalStorage();
    final value = await local.get();
    map = {...value ?? {}};

    map[id] = model.toMap();

    local.save(map);

    name.clear();
    numberIp.clear();
    notifyListeners();
  }

  Future<void> removeDevice(int i) async {
    listDevices.removeAt(i);
    notifyListeners();
  }

  int _relog = 10;
  int get relog => _relog;
  set relog(int relog) {
    _relog = relog;
    notifyListeners();
  }

  void onTimeUp(int i) {
    _relog += 5;
    listDevices[i] = listDevices[i].copyWith(time: relog * 60);
    listDevices[i] = listDevices[i].copyWith(changeTime: relog * 60);
    notifyListeners();
  }

  void onTimeDown(int i) {
    if (relog > 1) {
      _relog -= 5;
      listDevices[i] = listDevices[i].copyWith(time: relog * 60);
      listDevices[i] = listDevices[i].copyWith(changeTime: relog * 60);
    }
    notifyListeners();
  }

  void onChangeTime(int i, int time) async {
    final local = LocalStorage();
    final value = await local.get();
    final id = listDevices[i].id;
    final isValue = value?.keys.contains(id);
    value![id] =
        listDevices[i].copyWith(changeTime: listDevices[i].time - time).toMap();
    local.save(value);

    //print(listDevices[i].changeTime);
//    notifyListeners();
  }
}
