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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TimerCountdown(
        //   format: CountDownTimerFormat.minutesSeconds,
        //   colonsTextStyle: TextStyle(
        //       color: CustomColors.white,
        //       fontSize: context.dp(3),
        //       fontWeight: FontWeight.w900),
        //   endTime: DateTime.now().add(const Duration(minutes: 0)),
        //   timeTextStyle: TextStyle(
        //       color: CustomColors.white,
        //       fontSize: context.dp(3),
        //       fontWeight: FontWeight.w900),
        // ),
        CircularCountDownTimer(
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
          duration: ctl.listDevices[i].time,
          initialDuration:
              ctl.listDevices[i].changeTime == ctl.listDevices[i].time
                  ? 0
                  : ctl.listDevices[i].changeTime,
          autoStart: ctl.listDevices[i].state == 1 ? true : false,
          strokeCap: StrokeCap.round,
          fillColor: listCardColor[ctl.listDevices[i].colorCard][0],
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          ringColor:
              listCardColor[ctl.listDevices[i].colorCard][0].withOpacity(0.5),
        ),

        ////Controles tiempo
        // SizedBox(height: context.hp(2)),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         ctl.onTimeDown(i);
        //       },
        //       child: Container(
        //         width: context.wp(width / 3),
        //         height: context.wp(width / 3),
        //         decoration: BoxDecoration(
        //             color: CustomColors.button_100,
        //             borderRadius: BorderRadius.circular(context.dp(1))),
        //         child: Icon(Icons.arrow_back,
        //             color: CustomColors.white, size: context.dp(2)),
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         ctl.onTimeUp(i);
        //       },
        //       child: Container(
        //         width: context.wp(width / 3),
        //         height: context.wp(width / 3),
        //         decoration: BoxDecoration(
        //             color: CustomColors.button_100,
        //             borderRadius: BorderRadius.circular(context.dp(1))),
        //         child: Icon(Icons.arrow_forward,
        //             color: CustomColors.white, size: context.dp(2)),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
