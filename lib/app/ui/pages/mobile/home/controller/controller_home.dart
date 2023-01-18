import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:tcp_socket_connection/tcp_socket_connection.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    onIpInterna();
  }

  TextEditingController textEditingController = TextEditingController();

  String _ipInterna = '';
  String get ipInterna => _ipInterna;

  void onIpInterna() async {
    final ipv4 = await Ipify.ipv64();
    _ipInterna = ipv4;

    // TcpSocketConnection socketConnection =
    //     TcpSocketConnection(_ipInterna, 6464);
    notifyListeners();
  }

  String _msg = '';
  String get msg => _msg;
  set msg(String msg) {
    _msg = msg;
    notifyListeners();
  }

  void onConnect(String ip) async {
    TcpSocketConnection socketConnection = TcpSocketConnection(ip, 6464);
    if (await socketConnection.canConnect(5000, attempts: 3)) {
      //check if it's possible to connect to the endpoint
      await socketConnection.connect(5000, onRecived, attempts: 3);
    }

    notifyListeners();
  }

  void onRecived(String ip) {
    TcpSocketConnection socketConnection = TcpSocketConnection(ip, 6464);
    socketConnection.sendMessage("MessageIsReceived :D ");
    notifyListeners();
  }
}
