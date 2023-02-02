import 'package:timer_control/app/ui/helpers/global_helpers.dart';

import '../../add/controller/global_controller.dart';
import '../controller/global_controller.dart';

class CustomCountDown extends HookConsumerWidget {
  const CustomCountDown({
    super.key,
    this.i = 0,
    this.width = 30,
  });
  final int i;
  final double width;
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
          fontSize: context.dp(2),
          fontWeight: FontWeight.w900),
      strokeWidth: context.dp(2),
      width: context.wp(width),
      height: context.wp(width),
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
        ctl.onState(i, cl.state);
        cl.countController.reset();
      },
      onChange: (time) {
        //ctl.listDevices[i].time = int.parse(time);
        //log(time);
        //log("${DateTime.now().minute}:${DateTime.now().second}");
      },
      ringColor:
          listCardColor[ctl.listDevices[i].colorCard][0].withOpacity(0.5),
    );
  }
}
