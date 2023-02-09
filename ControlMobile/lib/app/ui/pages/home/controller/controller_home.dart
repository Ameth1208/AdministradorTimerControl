import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_control/app/dominio/data/local/local_storage.dart';
import 'package:timer_control/app/dominio/models/model_devices.dart';
import 'package:timer_control/app/ui/pages/add/controller/controller_add.dart';
import 'package:timer_control/app/ui/pages/device/controller/controller_device.dart';

///CONTROLLER ANDROID
class HomeController extends ChangeNotifier {
  ///[TimeGlobal]  la idea es crear una lista de tiempos que se pueda usar para la activacion de x equipo
  final AddDevicesController dvCtl;
  final DevicesController ctlAr;

  HomeController({required this.dvCtl, required this.ctlAr}) {
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
    final listDevices = dvCtl.listDevices;
    int r = listDevices.length;
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        onHoraR();

        for (int i = 0; i < r; i++) {
          ///tiempo actual
          int hr = int.parse(horaR.split(":")[0]);
          int mr = int.parse(horaR.split(":")[1]);
          int sr = int.parse(horaR.split(":")[2]);

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
              listDevices[i] = listDevices[i].copyWith(changeTime: rf);
              log("$rf");
            } else {
              final rf = (hr * 60 + mr * 60 + sr) - (hi * 60 + mi * 60 + si);
              listDevices[i] = listDevices[i].copyWith(changeTime: rf);
              log("$rf");
            }
          }

          ///Bloquear equipo
          if (hr == hf && mr == mf && sr == sf) {
            log("$horaR -- ${listDevices[i].horaEnd} : device $i");
            log("bloqueado");

            dvCtl.onState(i, 2);

            ctlAr.onStop(listDevices[i].numberIp);
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
}
