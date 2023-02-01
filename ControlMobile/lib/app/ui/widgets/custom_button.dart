import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = CustomColors.primary,
    this.text = '',
    this.onTap,
  });
  final Color color;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        listColor: const [CustomColors.button, CustomColors.button_100],
        width: context.wp(80),
        height: context.hp(5),
        radius: context.dp(5),
        child: CustomTextView.h3(
          text: text,
        ),
      ),
    );
  }
}
