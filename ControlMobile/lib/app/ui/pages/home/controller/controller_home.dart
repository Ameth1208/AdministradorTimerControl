import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timer_control/app/ui/pages/add/controller/controller_add.dart';

///CONTROLLER ANDROID
class HomeController extends ChangeNotifier {
  ///[TimeGlobal]  la idea es crear una lista de tiempos que se pueda usar para la activacion de x equipo
  final AddDevicesController dvCtl;

  HomeController({required this.dvCtl});

  void onTimeChange() {
    final listDevices = dvCtl.listDevices;

    log("message");
  }
}
