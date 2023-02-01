import 'package:timer_control/app/ui/helpers/global_helpers.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.fontSize = 1.5,
    this.hint = '',
    this.textInputType = TextInputType.text,
  });
  final TextEditingController? controller;
  final double fontSize;
  final String hint;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: CustomColors.white,
          fontSize: context.dp(fontSize),
          fontWeight: FontWeight.w700,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.white),
            borderRadius: BorderRadius.circular(context.dp(1))),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.white),
            borderRadius: BorderRadius.circular(context.dp(1))),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.white),
            borderRadius: BorderRadius.circular(context.dp(1))),
      ),
      style: TextStyle(
          color: CustomColors.white,
          fontSize: context.dp(fontSize),
          fontWeight: FontWeight.w700),
    );
  }
}
