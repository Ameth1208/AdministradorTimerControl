import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_control/app/ui/pages/windows/home/controller/controller_home.dart';

final homeWindowsProvider = ChangeNotifierProvider((ref) {
  return HomeController();
});
