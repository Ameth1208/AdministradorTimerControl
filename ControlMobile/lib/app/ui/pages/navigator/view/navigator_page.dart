import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/navigator/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

import '../../app_mobile.dart';

class NavigatorPage extends HookConsumerWidget {
  const NavigatorPage({super.key});
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        floatingActionButton: const CustomNavBar(),
        floatingActionButtonLocation: visible
            ? FloatingActionButtonLocation.centerFloat
            : FloatingActionButtonLocation.endFloat,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: ctl.pageController,
          children: const [
            HomeMobile(),
            AddItemList(),
          ],
        ),
      ),
    );
  }
}
