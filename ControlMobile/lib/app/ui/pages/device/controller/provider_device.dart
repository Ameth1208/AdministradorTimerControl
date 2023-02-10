import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:timer_control/app/ui/pages/home/controller/global_controller.dart';
import 'global_controller.dart';

final devicesProvider = ChangeNotifierProvider((ref) {
  final deviceControl = ref.watch(addDevicesProvider);
  final homeControl = ref.watch(homeProvider);
  return DevicesController(dvC: homeControl, addCtl: deviceControl);
});
