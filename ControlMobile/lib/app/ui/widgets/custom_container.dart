import 'package:timer_control/app/ui/helpers/global_helpers.dart';

class CustomContainer extends HookConsumerWidget {
  const CustomContainer({
    super.key,
    this.child,
    this.height = 100,
    this.width = 100,
    this.listColor,
    this.radius = 10,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  final Widget? child;
  final List<Color>? listColor;
  final double width, height;
  final double radius;
  final EdgeInsets padding, margin;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: listColor!,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
