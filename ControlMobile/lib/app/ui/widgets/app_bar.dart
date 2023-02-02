import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'global_widgets.dart';

class CustomAppBar extends HookConsumerWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }

    return Container(
      width: context.wd,
      color: Colors.transparent,
      padding: EdgeInsets.all(context.dp(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomContainer(
                width: context.wp(visible ? 15 : 5),
                height: context.wp(visible ? 15 : 5),
                radius: context.dp(visible ? 10 : 1),
                padding: EdgeInsets.all(context.wp(visible ? 3 : 1)),
                listColor: const [
                  CustomColors.primary_100,
                  CustomColors.primary,
                ],
                child: SvgPicture.asset(CustomIcons.logo),
              ),
              const Spacer(),
              const CustomTextView.h2(text: 'ArGame'),
              const Spacer(),
              CustomContainer(
                width: context.wp(visible ? 15 : 5),
                height: context.wp(visible ? 15 : 5),
                radius: context.dp(visible ? 10 : 1),
                padding: EdgeInsets.all(context.wp(visible ? 3 : 1)),
                listColor: const [
                  CustomColors.primary_100,
                  CustomColors.primary,
                ],
                child: const FaIcon(
                  FontAwesomeIcons.bell,
                  color: CustomColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
