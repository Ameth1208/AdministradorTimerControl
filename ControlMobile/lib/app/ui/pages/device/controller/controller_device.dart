// ignore_for_file: void_checks

import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:timer_control/app/dominio/data/data_glogal.dart';
import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:timer_control/app/ui/pages/home/controller/controller_home.dart';
import 'package:web_socket_channel/io.dart';

///CONTROLLER ANDROID
class DevicesController extends ChangeNotifier {
  DevicesController({
    required this.dvC,
    required this.addCtl,
  });
  final HomeController dvC;
  final AddDevicesController addCtl;

  CountDownController countController = CountDownController();

  ///[Time]
  final DateTime time = DateTime.now();
  final DateFormat timeFormat = DateFormat.Hms();

  String _horaR = "";

  String get horaR => _horaR;
  void onHoraR() {
    final DateTime h = DateTime.now();
    final DateFormat timeFormat = DateFormat.Hms();
    _horaR = timeFormat.format(h);
  }

  void onStart(int i) async {
    onHoraR();
    final String horaF = onHmOrS(horaR);

    final local = LocalStorage();
    final value = await local.get();
    final id = dvC.listDataLocal[i].id;
    //final isValue = value?.keys.contains(id);
    value![id] = dvC.listDataLocal[i]
        .copyWith(
          horaStart: _horaR,
          horaEnd: horaF,
        )
        .toMap();
    local.save(value);
    //final data = await local.get();
    dvC.onData();
    log("$horaR   --  $horaF ");

    countController.start();
    //notifyListeners();
  }

  String onHmOrS(String horaA) {
    int hf;
    int mf;
    int sf;
// ignore: prefer_typing_uninitialized_variables
    String horaEnd;

    if ((int.parse(horaA.split(":")[1]) + addCtl.relog) > 59) {
      sf = (int.parse(horaA.split(":")[2]));
      mf = (int.parse(horaA.split(":")[1]) + addCtl.relog) - 60;
      hf = (int.parse(horaA.split(":")[0]));
    } else {
      sf = (int.parse(horaA.split(":")[2]));
      mf = (int.parse(horaA.split(":")[1]) + addCtl.relog);
      hf = (int.parse(horaA.split(":")[0]));
    }
    if (sf < 10) {
      horaEnd = "$hf:$mf:0$sf";
      if (sf < 10 && mf < 10) {
        horaEnd = "$hf:0$mf:0$sf";
      }
    } else if (mf < 10) {
      horaEnd = "$hf:0$mf:$sf";
    } else {
      horaEnd = "$hf:$mf:$sf";
    }
    return horaEnd;
  }

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
}
