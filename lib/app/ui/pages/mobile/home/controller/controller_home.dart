import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:timer_control/app/dominio/models/model_devices.dart';

///CONTROLLER ANDROID
class HomeController extends ChangeNotifier {
  TextEditingController nameDevice = TextEditingController();
  TextEditingController numberIp = TextEditingController();

  ///[Connect IP Socket]
  void onLock(String ip) async {
    late IO.Socket socket;
    socket = IO.io(
        "http://$ip:6464",
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());

    socket.connect();
    socket.onConnect((data) {
      log('Connect ${socket.id} $ip');
      socket.emit("action-pc", "data");
    });
    socket.emit("action-pc", 'lock');
    notifyListeners();
  }

  void onDisconnect() {
    //socket.disconnect();
    notifyListeners();
  }

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
      nameDevices: nameDevice.text,
      numberIp: numberIp.text,
    ));
    state.add(true);
    visible.add(false);
    nameDevice.clear();
    numberIp.clear();
    notifyListeners();
  }
}
