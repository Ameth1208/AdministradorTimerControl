import 'package:timer_control/app/ui/helpers/global_helpers.dart';

class CustomTextView extends StatelessWidget {
  const CustomTextView({
    super.key,
    this.text = ' ',
    this.fontSize = 3,
    this.color = CustomColors.white,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
  });
  const CustomTextView.h1({
    super.key,
    this.text = ' ',
    this.fontSize = 2.5,
    this.color = CustomColors.white,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
  });

  const CustomTextView.h2({
    super.key,
    this.text = ' ',
    this.fontSize = 2,
    this.color = CustomColors.white,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
  });

  const CustomTextView.h3({
    super.key,
    this.text = ' ',
    this.fontSize = 1.5,
    this.color = CustomColors.white,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
  });

  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: context.dp(fontSize),
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
