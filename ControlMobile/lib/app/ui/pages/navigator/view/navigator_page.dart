import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/navigator/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

import '../../app_mobile.dart';

class NavigatorPage extends HookConsumerWidget {
  const NavigatorPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(navigatorProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        bottomNavigationBar: const CustomNavBar(),
        body: Container(
          child: Column(
            children: [
              const CustomAppBar(),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: ctl.pageController,
                  children: const [
                    HomeMobile(),
                    AddItemList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
