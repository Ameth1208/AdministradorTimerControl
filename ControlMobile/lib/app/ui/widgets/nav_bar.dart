import 'dart:developer';

import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/navigator/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/custom_text_view.dart';

class CustomNavBar extends HookConsumerWidget {
  const CustomNavBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(navigatorProvider);

    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }

    final List listWidget = [
      ["Home", Icons.home],
      ["Add", LineIcons.plus],
    ];

    return Container(
        padding: EdgeInsets.all(context.dp(0.5)),
        height: context.hp(visible ? 10 : 25),
        width: context.wp(visible ? 30 : 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: CustomColors.background_100,
            borderRadius: BorderRadius.circular(context.dp(5))),
        child: Visibility(
          replacement: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < listWidget.length; i++)
                  CustomNavBarItem(
                    text: listWidget[i][0],
                    icon: listWidget[i][1],
                    onTap: (i) {
                      log("$i");
                    },
                  ),
              ]),
          visible: !visible,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < listWidget.length; i++)
                CustomNavBarItem(
                  text: listWidget[i][0],
                  icon: listWidget[i][1],
                  index: i,
                  onTap: (i) {
                    ctl.onPage(i);
                  },
                )
            ],
          ),
        ));
  }
}

class CustomNavBarItem extends HookConsumerWidget {
  const CustomNavBarItem({
    super.key,
    this.color = CustomColors.white,
    this.icon = Icons.grid_view_rounded,
    this.text = '',
    required this.onTap,
    this.index = 0,
  });

  final IconData icon;
  final Color color;
  final String text;
  final TapIndex onTap;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
        height: context.hp(10),
        width: context.wp(10),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(color: color, icon),
            CustomTextView.h3(
              fontSize: 1,
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}

typedef TapIndex = Function(int i);
