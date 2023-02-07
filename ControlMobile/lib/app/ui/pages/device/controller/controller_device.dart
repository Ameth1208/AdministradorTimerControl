// ignore_for_file: void_checks

import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:web_socket_channel/io.dart';

///CONTROLLER ANDROID
class DevicesController extends ChangeNotifier {
  DevicesController({required this.dvC});
  final AddDevicesController dvC;

  CountDownController countController = CountDownController();

  ///[Time]
  final DateTime time = DateTime.now();
  final DateFormat timeFormat = DateFormat.Hm();

  void onStart(
    int i,
  ) {
    final String horaA = timeFormat.format(time);
    final String horaF = onHmOrS(horaA);
    log("$horaA   --  $horaF ");
    dvC.listDevices[i] = dvC.listDevices[i].copyWith(
      horaStart: horaA,
      horaEnd: horaF,
    );

    countController.start();
  }

  String onHmOrS(String horaA) {
    int hf;
    int mf;
    int sf;
// ignore: prefer_typing_uninitialized_variables
    String horaEnd;

    if ((int.parse(horaA.split(":")[1]) + 2) > 59) {
      mf = (int.parse(horaA.split(":")[1]) + 2) - 60;
      hf = (int.parse(horaA.split(":")[0]) + 1);
    } else {
      mf = (int.parse(horaA.split(":")[1]) + 2);
      hf = (int.parse(horaA.split(":")[0]));
    }
    if (mf < 10) {
      horaEnd = "$hf:0$mf";
    } else {
      horaEnd = "$hf:$mf";
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
