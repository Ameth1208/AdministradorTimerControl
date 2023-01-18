import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_control/app/ui/pages/mobile/home/controller/global_controller.dart';

class HomeMobile extends HookConsumerWidget {
  const HomeMobile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeProvider);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.textEditingController,
            ),
            Text(
              '${controller.ipInterna}Android',
            ),
          ],
        ),
      ),
    );
  }
}
