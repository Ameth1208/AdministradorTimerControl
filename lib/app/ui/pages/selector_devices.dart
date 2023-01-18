import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'global_apps.dart';

class SelectorDevices extends StatelessWidget {
  const SelectorDevices({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const HomeMobile();
    } else if (Platform.isWindows) {
      return const HomeWindows();
    } else {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const Text('Not detect Devices'),
        ),
      );
    }
  }
}
