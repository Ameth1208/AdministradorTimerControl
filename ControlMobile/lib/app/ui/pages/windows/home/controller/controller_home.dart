import 'dart:io';

import 'package:flutter/material.dart';
import 'package:process_run/shell_run.dart';
//import 'package:tcp_socket_connection/tcp_socket_connection.dart';

//CONTROLLER WINDOWS
class HomeController extends ChangeNotifier {
  HomeController() {
    onIpInterna();
    printIps();
  }

  final String _ipInterna = '';
  String get ipInterna => _ipInterna;

  void onIpInterna() async {
    //_ipInterna = await Ipify.ipv64();
    Socket socket = await Socket.connect(_ipInterna, 6464);

    notifyListeners();
  }

  void onConnect() async {
    // TcpSocketConnection socketConnection = TcpSocketConnection(ipInterna, 6464);
    // if (await socketConnection.canConnect(5000, attempts: 3)) {
    //   //check if it's possible to connect to the endpoint
    //   await socketConnection.connect(5000, onRecived, attempts: 3);
    // }

    notifyListeners();
  }

  void onRecived() {
    notifyListeners();
  }

  void onLock() {
    Shell().run('rundll32.exe user32.dll,LockWorkStation');
  }

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        print(addr.address);
      }
    }
  }
}
