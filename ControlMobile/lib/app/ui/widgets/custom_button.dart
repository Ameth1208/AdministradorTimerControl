import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_control/app/ui/helpers/global_helpers.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = CustomColors.primary,
    this.icon = CupertinoIcons.plus,
    this.onTap,
  });
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.dp(1)),
          color: color,
        ),
        alignment: Alignment.center,
        width: context.wp(10),
        height: context.wp(10),
        child: Icon(icon, color: CustomColors.white),
      ),
    );
  }
}
