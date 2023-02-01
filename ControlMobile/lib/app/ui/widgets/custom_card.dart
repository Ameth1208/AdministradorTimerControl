import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/widgets/custom_container.dart';
import 'package:timer_control/app/ui/widgets/custom_text_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.text = 'ArCars 1',
    required this.index,
    required this.tapIndex,
    this.img = CustomImages.arcade,
    this.state = 1,
    this.color = 0,
  });

  final String text;

  final OnTapIndex tapIndex;
  final int index;
  final String img;
  final int state;
  final int color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tapIndex(index),
      child: CustomContainer(
        margin: EdgeInsets.symmetric(
            horizontal: context.wp(2), vertical: context.hp(1)),
        padding: EdgeInsets.symmetric(
            horizontal: context.wp(3), vertical: context.hp(2)),
        width: context.wp(45),
        height: context.hp(20),
        listColor: listCardColor[color],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomContainer(
                  width: context.wp(15),
                  height: context.wp(15),
                  radius: context.dp(3),
                  padding: EdgeInsets.all(context.dp(1)),
                  listColor: [
                    CustomColors.primary.withOpacity(0.2),
                    CustomColors.white.withOpacity(0.2),
                  ],
                  child: Image.asset(
                    img,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                StateCard(
                  state: state,
                ),
              ],
            ),
            const Spacer(),
            CustomTextView.h2(
              textAlign: TextAlign.right,
              text: text,
              //color: CustomColors.background,
            ),
          ],
        ),
      ),
    );
  }
}

class StateCard extends StatelessWidget {
  const StateCard({super.key, this.state = 1});

  final int state;

  @override
  Widget build(BuildContext context) {
    final color = state == 0
        ? [CustomColors.gradientActive_100, CustomColors.gradientActive]
        : state == 1
            ? [CustomColors.gradientOcup_100, CustomColors.gradientOcup]
            : [CustomColors.gradientLock_100, CustomColors.gradientLock];

    return CustomContainer(
      width: context.wp(8),
      height: context.wp(8),
      radius: context.dp(3),
      listColor: [
        CustomColors.primary.withOpacity(0.2),
        CustomColors.white.withOpacity(0.2),
        // listCardColor[colorState][1],
        // listCardColor[colorState][0],
      ],
      child: CustomContainer(
        radius: context.dp(3),
        width: context.wp(5),
        height: context.wp(5),
        listColor: color,
      ),
    );
  }
}

typedef OnTapIndex = Function(int i);
