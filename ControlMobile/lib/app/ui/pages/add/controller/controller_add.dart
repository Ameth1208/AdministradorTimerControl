import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timer_control/app/dominio/models/model_devices.dart';
import 'package:timer_control/app/ui/helpers/custom_assets.dart';
import 'package:timer_control/app/ui/helpers/custom_colors.dart';

///CONTROLLER ANDROID
class AddDevicesController extends ChangeNotifier {
  PageController pageController = PageController();

  TextEditingController name = TextEditingController();
  TextEditingController numberIp = TextEditingController();

  List<ModelDevices> _listDevices = [];
  List<ModelDevices> get listDevices => _listDevices;
  set listDevices(List<ModelDevices> listDevices) {
    _listDevices = listDevices;
    notifyListeners();
  }

  void onState(int i, int t) {
    listDevices[i] = listDevices[i].copyWith(state: t);
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
  void onAdd(int p) {
    // log(nameDevice.text);
    // log(numberIp.text);

    listDevices.add(ModelDevices(
      name: name.text,
      numberIp: numberIp.text,
      state: 0,
      type: listImageDevices[p],
      colorCard: Random().nextInt(listCardColor.length),

      ///time minutos
      time: 300,
      changeTime: 300,

      ///
      horaStart: 0,
      horaEnd: 0,
    ));

    name.clear();
    numberIp.clear();
    notifyListeners();
  }

  Future<void> removeDevice(int i) async {
    listDevices.removeAt(i);
    notifyListeners();
  }

  int _relog = 5;
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

  void onChangeTime(int i, int time) {
    listDevices[i] =
        listDevices[i].copyWith(changeTime: listDevices[i].time - time);
    //print(listDevices[i].changeTime);
//    notifyListeners();
  }
}
