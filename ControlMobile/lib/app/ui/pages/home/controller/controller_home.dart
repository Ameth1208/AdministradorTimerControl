import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_control/app/ui/pages/add/controller/controller_add.dart';
import 'package:timer_control/app/ui/pages/device/controller/controller_device.dart';

///CONTROLLER ANDROID
class HomeController extends ChangeNotifier {
  ///[TimeGlobal]  la idea es crear una lista de tiempos que se pueda usar para la activacion de x equipo
  final AddDevicesController dvCtl;
  final DevicesController ctlAr;

  HomeController({required this.dvCtl, required this.ctlAr});

  String _horaR = "";

  String get horaR => _horaR;

  void onHoraR() {
    final DateTime h = DateTime.now();
    final DateFormat timeFormat = DateFormat.Hm();
    _horaR = timeFormat.format(h);
    //notifyListeners();
  }

  void onTimeChange() async {
    final listDevices = dvCtl.listDevices;
    int r = listDevices.length;
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        onHoraR();
        for (int i = 0; i < r; i++) {
          log("$horaR -- ${listDevices[i].horaEnd}");
          if (int.parse(horaR.split(":")[0]) ==
                  int.parse(listDevices[i].horaEnd.split(":")[0]) &&
              int.parse(horaR.split(":")[1]) ==
                  int.parse(listDevices[i].horaEnd.split(":")[1])) {
            log("bloqueado");
            listDevices[i].copyWith(
              horaStart: "00:00",
              horaEnd: "00:00",
              state: 2,
            );

            ctlAr.onStop(listDevices[i].numberIp);
          }

          if (i == r) {
            i = 0;
          }
          log("$i");
        }

        log("busco");
      },
    );

    log("Home");
  }
}
