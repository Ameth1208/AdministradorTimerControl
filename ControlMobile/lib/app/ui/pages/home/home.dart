import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

import 'view/list_card.dart';

class HomeMobile extends HookConsumerWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final ctlr = ref.watch(homeProvider);
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
