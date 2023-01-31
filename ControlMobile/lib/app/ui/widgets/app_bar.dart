import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'global_widgets.dart';

class CustomAppBar extends HookConsumerWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                width: context.wp(15),
                height: context.wp(15),
                radius: context.dp(10),
                padding: EdgeInsets.all(context.wp(3)),
                listColor: const [
                  CustomColors.primary_100,
                  CustomColors.primary,
                ],
                child: SvgPicture.asset(CustomIcons.logo),
              ),
              const Spacer(),
              CustomContainer(
                width: context.wp(15),
                height: context.wp(15),
                radius: context.dp(1),
                padding: EdgeInsets.all(context.wp(3)),
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
          SizedBox(height: context.hp(2)),
          const CustomTextView.h1(
            text: 'Welcome to ArGame',
          )
        ],
      ),
    );
  }
}
