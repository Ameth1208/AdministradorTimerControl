import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class ContentImg extends HookConsumerWidget {
  const ContentImg({
    super.key,
    this.w = 70,
  });

  final double w;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = listImageDevices;
    final ctl = ref.watch(addDevicesProvider);

    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(
          padding: EdgeInsets.all(context.dp(2)),
          height: context.wp(w),
          width: context.wp(w),
          listColor: const [
            CustomColors.button_100,
            CustomColors.button,
          ],
          child: PageView.builder(
            controller: ctl.pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (i) {
              ctl.type = i;
            },
            itemCount: list.length,
            itemBuilder: (_, i) {
              return Center(child: Image.asset(list[i], fit: BoxFit.contain));
            },
          ),
        ),
        SizedBox(height: context.hp(1)),
        Visibility(
          visible: !visible,
          child: SizedBox(
            width: context.wp(w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    ctl.pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut);
                  },
                  child: Container(
                    width: context.wp(3),
                    height: context.wp(3),
                    decoration: BoxDecoration(
                        color: CustomColors.button_100,
                        borderRadius: BorderRadius.circular(context.dp(5))),
                    child: const Icon(
                      Icons.arrow_back,
                      color: CustomColors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ctl.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut);
                  },
                  child: Container(
                    width: context.wp(3),
                    height: context.wp(3),
                    decoration: BoxDecoration(
                        color: CustomColors.button_100,
                        borderRadius: BorderRadius.circular(context.dp(5))),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: CustomColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
