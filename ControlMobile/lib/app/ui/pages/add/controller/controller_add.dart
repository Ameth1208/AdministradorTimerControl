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

  final List<int> _state = [];
  List<int> get state => _state;
  void onState(int i, int t) {
    _state[i] = t;
    notifyListeners();
  }

  ///[Position Image]
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
      time: 60,
    ));

    state.add(0);
    name.clear();
    numberIp.clear();
    notifyListeners();
  }
}
