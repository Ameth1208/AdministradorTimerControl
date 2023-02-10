import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_control/app/ui/pages/home/controller/global_controller.dart';
import 'global_controller.dart';

final addDevicesProvider = ChangeNotifierProvider((ref) {
  final homeControler = ref.watch(homeProvider);
  return AddDevicesController(homeCtl: homeControler);
});
