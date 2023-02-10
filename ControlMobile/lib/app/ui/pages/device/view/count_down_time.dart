import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/home/controller/global_controller.dart';

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
    final cth = ref.watch(homeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularCountDownTimer(
          controller: cl.countController,
          backgroundColor:
              listCardColor[cth.listDataLocal[i].colorCard][0].withOpacity(0.8),
          textStyle: TextStyle(
              color: CustomColors.white,
              fontSize: context.dp(2),
              fontWeight: FontWeight.w900),
          strokeWidth: context.dp(2),
          width: context.wp(width),
          height: context.wp(width),
          duration: cth.listDataLocal[i].time,
          initialDuration:
              cth.listDataLocal[i].changeTime == cth.listDataLocal[i].time
                  ? 0
                  : cth.listDataLocal[i].changeTime,
          autoStart: cth.listDataLocal[i].state == 1 ? true : false,
          strokeCap: StrokeCap.round,
          fillColor: listCardColor[cth.listDataLocal[i].colorCard][0],
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          ringColor:
              listCardColor[cth.listDataLocal[i].colorCard][0].withOpacity(0.5),
        ),

        ////Controles tiempo
        SizedBox(height: context.hp(2)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                ctl.onTimeDown(i);
                cth.onData();
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
                cth.onData();
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
