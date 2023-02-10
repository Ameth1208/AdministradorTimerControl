import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_control/app/ui/pages/device/device.dart';
import 'package:timer_control/app/ui/pages/home/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/custom_card.dart';

class ListCard extends HookConsumerWidget {
  const ListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(homeProvider);
    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }
    ctl.onData();

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Visibility(
          visible: !ctl.listDataLocal.isNotEmpty ? false : true,
          child: Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < ctl.listDataLocal.length; i++)
                CustomCard(
                  width: visible ? 45 : 20,
                  height: visible ? 20 : 40,
                  index: i,
                  text: ctl.listDataLocal[i].name,
                  state: ctl.listDataLocal[i].state,
                  img: ctl.listDataLocal[i].type,
                  color: ctl.listDataLocal[i].colorCard,
                  tapIndex: (i) {
                    ctl.listDataLocal.isNotEmpty
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
