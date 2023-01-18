import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:process_run/shell_run.dart';
import 'package:tcp_socket_connection/tcp_socket_connection.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    onIpInterna();
  }

  String _ipInterna = '';
  String get ipInterna => _ipInterna;

  void onIpInterna() async {
    final ipv4 = await Ipify.ipv64();
    _ipInterna = ipv4;
    notifyListeners();
  }

  void onConnect() async {
    TcpSocketConnection socketConnection = TcpSocketConnection(ipInterna, 6464);
    if (await socketConnection.canConnect(5000, attempts: 3)) {
      //check if it's possible to connect to the endpoint
      await socketConnection.connect(5000, onRecived, attempts: 3);
    }

    notifyListeners();
  }

  void onRecived() {
    TcpSocketConnection socketConnection = TcpSocketConnection(ipInterna, 6464);
    socketConnection.sendMessage("MessageIsReceived :D ");
    notifyListeners();
  }

  void onLock() {
    Shell().run('rundll32.exe user32.dll,LockWorkStation');
  }
}
