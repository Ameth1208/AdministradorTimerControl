import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class CustomButtonDevices extends HookConsumerWidget {
  const CustomButtonDevices({
    super.key,
    this.text = '',
    this.onTap,
    this.icon = LineIcons.lock,
    this.color = CustomColors.button,
    this.w = 100,
  });
  final String text;
  final VoidCallback? onTap;
  final IconData icon;
  final Color color;
  final double w;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }

    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        //listColor: listCardColor[ctl.listDevices[i].colorCard],
        width: visible ? w : 70,
        height: visible ? w : 70,
        listColor: [color, color],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: CustomColors.white),
            CustomTextView.h3(
              text: text,
              fontSize: visible ? 1.5 : 1,
            )
          ],
        ),
      ),
    );
  }
}
