import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'global_controller.dart';

final navigatorProvider = ChangeNotifierProvider((ref) {
  return NavigatorController();
});
