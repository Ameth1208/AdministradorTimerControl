import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_control/app/ui/pages/mobile/home/controller/controller_home.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeController();
});
