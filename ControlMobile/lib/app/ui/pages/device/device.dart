import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';

import 'package:timer_control/app/ui/widgets/global_widgets.dart';

import 'controller/global_controller.dart';
import 'view/global_view.dart';

class DeviceView extends HookConsumerWidget {
  const DeviceView({
    super.key,
    this.i = 0,
  });

  final int i;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(addDevicesProvider);
    final socket = ref.watch(devicesProvider);

    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }

    final List<Widget> listWidget = [
      CustomButtonDevices(
        text: 'Unlock',
        icon: LineIcons.unlock,
        color: CustomColors.button,
        onTap: () {
          socket.state = 0;
          ctl.onState(i, socket.state);
        },
      ),
      SizedBox(height: context.hp(5)),
      CustomButtonDevices(
        text: 'Start',
        icon: LineIcons.play,
        color: CustomColors.color_30,
        onTap: () {
          socket.onStart();
          socket.state = 1;
          ctl.onState(i, socket.state);
        },
      ),
      SizedBox(height: context.hp(5)),
      CustomButtonDevices(
        text: 'Stop',
        color: CustomColors.gradientLock,
        icon: LineIcons.stop,
        onTap: () {
          socket.onStop(ctl.listDevices[i].numberIp);
          socket.state = 2;
          ctl.onState(i, socket.state);
        },
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomTextView.h2(text: ctl.listDevices[i].name),
          centerTitle: true,
          actions: const [
            // InkWell(
            //   onTap: () async {
            //     await ctl.removeDevice(i);
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     width: context.wp(3),
            //     height: context.wp(3),
            //     decoration: BoxDecoration(
            //         color: CustomColors.gradientLock,
            //         borderRadius: BorderRadius.circular(context.dp(1))),
            //     child: const Icon(
            //       Icons.delete,
            //       color: CustomColors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
        body: Container(
          width: context.wd,
          alignment: Alignment.center,
          child: ListView(
            children: [
              SizedBox(height: context.hp(visible ? 5 : 0)),
              Visibility(
                visible: visible,

                //Screen Horizontales
                replacement: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///CountDown

                    CardDeviceView(i: i, w: 70, h: 80),
                    SizedBox(width: context.wp(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: listWidget,
                    ),
                  ],
                ),
                //Screen Verticales
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///CountDown
                    CardDeviceView(i: i),

                    SizedBox(height: context.hp(5)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: listWidget,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: CustomColors.background,
      ),
    );
  }
}
