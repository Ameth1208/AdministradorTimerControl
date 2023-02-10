import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/home/controller/global_controller.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

import 'view/list_card.dart';

class HomeMobile extends HookConsumerWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(homeProvider);
    if (ctl.listDataLocal.isNotEmpty) {
      ctl.onTimeChange();
      ctl.onData();
    }
    return SafeArea(
      child: Column(
        children: const [
          CustomAppBar(),
          Expanded(child: ListCard()),
        ],
      ),
    );
  }
}
