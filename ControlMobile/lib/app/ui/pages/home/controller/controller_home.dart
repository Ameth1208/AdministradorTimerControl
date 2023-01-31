import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:timer_control/app/dominio/models/model_devices.dart';

///CONTROLLER ANDROID
class HomeController extends ChangeNotifier {
  TextEditingController nameDevice = TextEditingController();
  TextEditingController numberIp = TextEditingController();

  ///[Connect IP Socket]
  void onConnect(String ip) async {
    notifyListeners();
  }

  void onRecived() {
    notifyListeners();
  }

  void onSetTime(int i) {}

  ///[Acciones visuales]
  List<ModelDevices> _listDevices = [];
  List<ModelDevices> get listDevices => _listDevices;
  set listDevices(List<ModelDevices> listDevices) {
    _listDevices = listDevices;
  }

  ///[State Devices]
  final List<bool> _state = [];
  List<bool> get state => _state;
  void onState(int i, bool value) {
    _state[i] = !value;
    notifyListeners();
  }

  ///[VisibleCard]
  final List<bool> _visible = [];
  List<bool> get visible => _visible;
  void onVisible(int i, bool value) {
    _visible[i] = !value;
    notifyListeners();
  }

  ///[Añadir dispositivo]
  void onAdd() {
    log(nameDevice.text);
    log(numberIp.text);

    listDevices.add(ModelDevices(
      nameDevices: nameDevice.text,
      numberIp: numberIp.text,
    ));
    state.add(true);
    visible.add(true);
    nameDevice.clear();
    numberIp.clear();
    notifyListeners();
  }
}
