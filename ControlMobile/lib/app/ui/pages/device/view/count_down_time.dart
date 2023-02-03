import 'dart:developer';

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
              ctl.listDevices[i].time == ctl.listDevices[i].changeTime
                  ? 0
                  : ctl.listDevices[i].changeTime,
          autoStart: ctl.listDevices[i].time == ctl.listDevices[i].changeTime
              ? false
              : true,
          strokeCap: StrokeCap.round,
          fillColor: listCardColor[ctl.listDevices[i].colorCard][0],
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          onComplete: () {
            cl.onLock(ctl.listDevices[i].numberIp);
            ctl.onChangeTime(i, ctl.listDevices[i].time);
            ctl.onState(i, 2);
            cl.countController.pause();
          },
          onChange: (time) {
            final int timeFinal;
            if (time.contains(":")) {
              timeFinal = int.parse(time.split(":")[0]) * 60 +
                  int.parse(time.split(":")[1]);
            } else {
              timeFinal = int.parse(time);
            }
            log("$timeFinal relog");
            ctl.onChangeTime(i, timeFinal);
          },
          ringColor:
              listCardColor[ctl.listDevices[i].colorCard][0].withOpacity(0.5),
        ),

        ////Controles tiempo
        SizedBox(height: context.hp(5)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                ctl.onTimeDown(i);
              },
              child: Container(
                width: context.wp(width / 3),
                height: context.wp(width / 3),
                decoration: BoxDecoration(
                    color: CustomColors.button_100,
                    borderRadius: BorderRadius.circular(context.dp(1))),
                child: Icon(Icons.arrow_back,
                    color: CustomColors.white, size: context.dp(2)),
              ),
            ),
            InkWell(
              onTap: () {
                ctl.onTimeUp(i);
              },
              child: Container(
                width: context.wp(width / 3),
                height: context.wp(width / 3),
                decoration: BoxDecoration(
                    color: CustomColors.button_100,
                    borderRadius: BorderRadius.circular(context.dp(1))),
                child: Icon(Icons.arrow_forward,
                    color: CustomColors.white, size: context.dp(2)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
