import 'package:flutter/cupertino.dart';
import 'package:timer_control/app/ui/helpers/global_helpers.dart';

class CustomTextView extends StatelessWidget {
  const CustomTextView({
    super.key,
    this.text = ' ',
    this.fontSize = 3,
    this.color = CustomColors.primary,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
    this.width = 100,
  });
  const CustomTextView.h1({
    super.key,
    this.text = ' ',
    this.fontSize = 2.5,
    this.color = CustomColors.primary,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
    this.width = 100,
  });

  const CustomTextView.h2({
    super.key,
    this.text = ' ',
    this.fontSize = 2,
    this.color = CustomColors.primary,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
    this.width = 100,
  });

  const CustomTextView.h3({
    super.key,
    this.text = ' ',
    this.fontSize = 1.5,
    this.color = CustomColors.primary,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.bold,
    this.onTap,
    this.width = 100,
  });

  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: context.wp(width),
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: context.dp(fontSize),
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
