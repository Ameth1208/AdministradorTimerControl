import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_control/app/ui/helpers/custom_colors.dart';
import '../controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/custom_card.dart';

class ListCard extends HookConsumerWidget {
  const ListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeProvider);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: controller.listDevices.length,
      itemBuilder: (_, i) {
        return CustomCard(
          index: i,
          color: !controller.state[i]
              ? CustomColors.stateLibre
              : CustomColors.stateLock,
          visible: !controller.visible[i],
          ipText: controller.listDevices[i].numberIp,
          text: controller.listDevices[i].nameDevices,
          idTap: (a) {
            controller.onVisible(i, controller.visible[i]);
          },
          lock: (i) {},
          time: (i) {
            controller.onConnect(controller.listDevices[i].numberIp);
          },
          unLock: (i) {},
        );
      },
    );
  }
}
