import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

import '../../add/controller/global_controller.dart';
import 'global_view.dart';

class CardDeviceView extends HookConsumerWidget {
  const CardDeviceView({super.key, this.i = 0, this.w = 90, this.h = 30});
  final double w, h;
  final int i;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(addDevicesProvider);
    return CustomContainer(
      padding: EdgeInsets.all(context.dp(2)),
      width: context.wp(w),
      height: context.hp(h),
      listColor: const [
        CustomColors.primary_100,
        CustomColors.primary_100,
      ],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.wp(w / 3),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Image.asset(
                  ctl.listDevices.isNotEmpty
                      ? ctl.listDevices[i].type
                      : CustomImages.arcade,
                ),
                Positioned(
                  right: context.wp(1),
                  top: context.hp(1),
                  child: StateCard(
                    state: ctl.state[i],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: context.wp(2)),
          SizedBox(
              width: context.wp(w / 2),
              child: CustomCountDown(i: i, width: w / 3)),
        ],
      ),
    );
  }
}
