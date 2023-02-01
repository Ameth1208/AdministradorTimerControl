import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class CustomButtonDevices extends HookConsumerWidget {
  const CustomButtonDevices({
    super.key,
    this.text = '',
    this.onTap,
    this.icon = LineIcons.lock,
    this.color = CustomColors.button,
  });
  final String text;
  final VoidCallback? onTap;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        //listColor: listCardColor[ctl.listDevices[i].colorCard],
        listColor: [color, color],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: CustomColors.white),
            CustomTextView.h3(text: text)
          ],
        ),
      ),
    );
  }
}
