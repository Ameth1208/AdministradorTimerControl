import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_control/app/ui/pages/device/device.dart';
import '../../add/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/custom_card.dart';

class ListCard extends HookConsumerWidget {
  const ListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(addDevicesProvider);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < ctl.listDevices.length; i++)
              CustomCard(
                index: i,
                text: ctl.listDevices[i].name,
                state: ctl.state[i],
                img: ctl.listDevices[i].type,
                color: ctl.listDevices[i].colorCard,
                tapIndex: (i) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DeviceView(i: i)));
                },
              )
          ],
        ),
      ],
    );
  }
}
