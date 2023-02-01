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

//    socket.onConnet("");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: context.wp(15),
          backgroundColor: Colors.transparent,
          title: CustomTextView.h2(text: ctl.listDevices[i].name),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.hp(1)),
                  Image.asset(ctl.listDevices[i].type, height: context.hp(25)),
                  SizedBox(height: context.hp(5)),

                  ///CountDown
                  CustomCountDown(i: i),
                  SizedBox(height: context.hp(5)),

                  ///State
                  StateCard(state: ctl.state[i]),
                  SizedBox(height: context.hp(5)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonDevices(
                        text: 'Unlock',
                        icon: LineIcons.unlock,
                        color: CustomColors.button,
                        onTap: () {
                          socket.state = 0;
                          ctl.onState(i, socket.state);
                        },
                      ),
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
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: CustomColors.primary_100,
      ),
    );
  }
}
