import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_control/app/ui/pages/windows/home/controller/global_controller.dart';

class HomeWindows extends HookConsumerWidget {
  const HomeWindows({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeWindowsProvider);
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => controller.onLock(),
            child: Text('${controller.ipInterna} Windows'),
          )
        ],
      ),
    ));
  }
}
