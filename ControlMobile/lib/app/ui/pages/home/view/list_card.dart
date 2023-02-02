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
    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Visibility(
          visible: !ctl.listDevices.isNotEmpty ? false : true,
          child: Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < ctl.listDevices.length; i++)
                CustomCard(
                  width: visible ? 45 : 20,
                  height: visible ? 20 : 40,
                  index: i,
                  text: ctl.listDevices[i].name,
                  state: ctl.state[i],
                  img: ctl.listDevices[i].type,
                  color: ctl.listDevices[i].colorCard,
                  tapIndex: (i) {
                    ctl.listDevices.isNotEmpty
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (_) => DeviceView(i: i)))
                        : null;
                  },
                )
            ],
          ),
        ),
      ],
    );
  }
}
