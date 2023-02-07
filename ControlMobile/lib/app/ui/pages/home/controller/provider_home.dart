import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:timer_control/app/ui/pages/device/controller/global_controller.dart';
import 'package:timer_control/app/ui/pages/home/controller/controller_home.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  final deviceControll = ref.watch(addDevicesProvider);
  final ctlControl = ref.watch(devicesProvider);
  return HomeController(dvCtl: deviceControll, ctlAr: ctlControl);
});
