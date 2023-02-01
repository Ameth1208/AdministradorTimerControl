import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class ContentImg extends HookConsumerWidget {
  const ContentImg({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = listImageDevices;
    final ctl = ref.watch(addDevicesProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(
          padding: EdgeInsets.all(context.dp(2)),
          height: context.wp(70),
          width: context.wp(70),
          listColor: const [
            CustomColors.button_100,
            CustomColors.button,
          ],
          child: PageView.builder(
            controller: ctl.pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (p) {
              ctl.type = p;
            },
            itemCount: list.length,
            itemBuilder: (_, i) {
              return Center(child: Image.asset(list[i], fit: BoxFit.contain));
            },
          ),
        ),
      ],
    );
  }
}
