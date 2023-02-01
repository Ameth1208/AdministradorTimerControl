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
        labelText: hint,
        labelStyle: TextStyle(
          color: CustomColors.primary_100,
          fontSize: context.dp(fontSize),
          fontWeight: FontWeight.w700,
        ),
        border: const OutlineInputBorder(),
      ),
      style: TextStyle(
          color: CustomColors.primary,
          fontSize: context.dp(fontSize),
          fontWeight: FontWeight.w700),
    );
  }
}
