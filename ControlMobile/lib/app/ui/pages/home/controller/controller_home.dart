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

  void onDisconnect() {
    //socket.disconnect();
    notifyListeners();
  }

  void onSetTime(int i) {}

  ///[Acciones visuales]
  List<ModelDevices> _listDevices = [];
  List<ModelDevices> get listDevices => _listDevices;
  set listDevices(List<ModelDevices> listDevices) {
    _listDevices = listDevices;
    notifyListeners();
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
        name: nameDevice.text, numberIp: numberIp.text, state: 0, type: 1));

    nameDevice.clear();
    numberIp.clear();
    notifyListeners();
  }
}
