import 'package:timer_control/app/ui/helpers/global_helpers.dart';

import '../../add/controller/global_controller.dart';
import '../controller/global_controller.dart';

class CustomCountDown extends HookConsumerWidget {
  const CustomCountDown({
    super.key,
    this.i = 0,
  });
  final int i;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(addDevicesProvider);
    final cl = ref.watch(devicesProvider);
    return CircularCountDownTimer(
      controller: cl.countController,
      backgroundColor:
          listCardColor[ctl.listDevices[i].colorCard][0].withOpacity(0.8),
      textStyle: TextStyle(
          color: CustomColors.white,
          fontSize: context.dp(5),
          fontWeight: FontWeight.w900),
      strokeWidth: context.dp(3),
      width: context.wp(50),
      height: context.wp(50),
      duration: 10 * 1,
      autoStart: false,
      strokeCap: StrokeCap.round,
      fillColor: listCardColor[ctl.listDevices[i].colorCard][0],
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      onComplete: () {
        cl.onLock(ctl.listDevices[i].numberIp);
        cl.state = 2;
        ctl.listDevices[i].state == cl.state;

        cl.countController.reset();
      },
      onChange: (time) {
        //ctl.listDevices[i].time = int.parse(time);
        //log(time);
      },
      ringColor:
          listCardColor[ctl.listDevices[i].colorCard][0].withOpacity(0.5),
    );
  }
}
