import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_control/app/dominio/data/local/local_storage.dart';
import 'package:timer_control/app/dominio/models/model_devices.dart';
import 'package:web_socket_channel/io.dart';

///CONTROLLER ANDROID
class HomeController extends ChangeNotifier {
  ///[TimeGlobal]  la idea es crear una lista de tiempos que se pueda usar para la activacion de x equipo
  //final AddDevicesController dvCtl;

  HomeController() {
    onData();
  }

  String _horaR = "";

  String get horaR => _horaR;

  void onHoraR() {
    final DateTime h = DateTime.now();
    final DateFormat timeFormat = DateFormat.Hms();
    _horaR = timeFormat.format(h);
    //notifyListeners();
  }

  void onData() async {
    final local = LocalStorage();
    final value = await local.get();
    // final List val = value!.replaceAll("[", "").replaceAll("]", "").split(",");
    final decoList =
        value?.values.map((e) => (ModelDevices.fromMap(e))).toList() ?? [];
    //print(decoList);
    _listDataLocal = decoList;
    notifyListeners();
  }

  List<ModelDevices> _listDataLocal = [];
  List<ModelDevices> get listDataLocal => _listDataLocal;
  set listDataLocal(List<ModelDevices> listDataLocal) {
    _listDataLocal = listDataLocal;
    notifyListeners();
  }

  ///[Tiempos de Arcades]
  void onTimeChange() async {
    final listDevices = _listDataLocal;
    int r = listDevices.length;

    ///List
    final local = LocalStorage();
    final value = await local.get();

    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        //onData();

        for (int i = 0; i < r; i++) {
          onHoraR();

          ///Lista
          final id = listDevices[i].id;
          log(_horaR + "  " + listDevices[i].horaEnd);

          ///tiempo actual
          int hr = int.parse(_horaR.split(":")[0]);
          int mr = int.parse(_horaR.split(":")[1]);
          int sr = int.parse(_horaR.split(":")[2]);

          ///tiempo final
          int hf = int.parse(listDevices[i].horaEnd.split(":")[0]);
          int mf = int.parse(listDevices[i].horaEnd.split(":")[1]);
          int sf = int.parse(listDevices[i].horaEnd.split(":")[2]);

          ///tiempo inicial
          int hi = int.parse(listDevices[i].horaStart.split(":")[0]);
          int mi = int.parse(listDevices[i].horaStart.split(":")[1]);
          int si = int.parse(listDevices[i].horaStart.split(":")[2]);

          if ((hr <= hf || mr <= mf || sr <= sf) && listDevices[i].state == 1) {
            if (hr == hi) {
              final rf = (mr * 60 + sr) - (mi * 60 + si);
              // value![id] = listDataLocal[i].copyWith(changeTime: rf).toMap();
              // local.save(value);

              log("$rf");
            } else {
              final rf = (hr * 60 + mr * 60 + sr) - (hi * 60 + mi * 60 + si);
              // value![id] = listDataLocal[i].copyWith(changeTime: rf).toMap();
              // local.save(value);
              log("$rf");
            }
            log("$_horaR --  : device $i");
          }

          ///Bloquear equipo
          if (hr == hf && mr == mf && sr == sf) {
            log("$_horaR -- ${listDevices[i].horaEnd} : device $i");
            log("bloqueado");

            onState(i, 2);

            onStop(listDevices[i].numberIp);
          }

          Future.delayed(
            const Duration(seconds: 1),
            () {
              if (i == r) {
                i = 0;
              }
            },
          );
        }

        //log("busco");
      },
    );
  }

  void onState(int i, int t) async {
    final local = LocalStorage();
    final value = await local.get();
    final id = listDataLocal[i].id;

    value![id] = listDataLocal[i].copyWith(state: t).toMap();
    local.save(value);
    onData();

    notifyListeners();
  }

  ///[SOCKET]
  ///
  void onLock(String ip) {
    socketEvent("timeUp", ip);
  }

  void onStop(String ip) {
    socketEvent("timeUp", ip);
  }

  ///[unlock]
  void onUnlock(String ip) {
    socketEvent("unlock", ip);
  }

  ///[Socket]
  void socketEvent(String action, String ip) {
    IOWebSocketChannel? channel;
    try {
      channel = IOWebSocketChannel.connect('ws://$ip:8080');
    } catch (e) {
      // ignore: avoid_print
      print("Error on connecting to websocket: $e");
    }
    channel?.sink.add(action);
    channel?.stream.listen((event) {
      print(event);
      // Now only close the connection and we are done here!
      channel!.sink.close();
    });
  }

  ///[]

}
