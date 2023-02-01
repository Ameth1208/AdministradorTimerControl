import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/navigator/controller/global_controller.dart';

class CustomNavBar extends HookConsumerWidget {
  const CustomNavBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(navigatorProvider);
    return GNav(
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 500),
      activeColor: CustomColors.white,
      style: GnavStyle.google,
      padding: EdgeInsets.symmetric(
          horizontal: context.wp(10), vertical: context.hp(2)),
      backgroundColor: CustomColors.background_100,
      onTabChange: (i) => ctl.pageController.jumpToPage(i),
      gap: 0,
      tabs: const [
        GButton(
          icon: LineIcons.home,
          text: '   Inicio',
          iconColor: CustomColors.white,
        ),
        GButton(
          icon: LineIcons.plus,
          text: '   Añadir',
          iconColor: CustomColors.white,
        ),
        // GButton(
        //   icon: Icons.person,
        //   text: '   Usuario',
        //   iconColor: CustomColors.white,
        // ),
      ],
    );
  }
}
