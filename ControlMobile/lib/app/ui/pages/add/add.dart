import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:timer_control/app/ui/pages/add/view/content_img.dart';
import 'package:timer_control/app/ui/pages/navigator/controller/global_controller.dart';

import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class AddItemList extends HookConsumerWidget {
  const AddItemList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(addDevicesProvider);
    final nt = ref.watch(navigatorProvider);
    return Padding(
      padding: EdgeInsets.all(context.dp(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.hp(2)),
          const CustomTextView.h1(text: 'Select Devices'),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: context.hp(5)),
                const Center(child: ContentImg()),
                SizedBox(height: context.hp(5)),
                CustomTextField(hint: 'Name device', controller: ctl.name),
                SizedBox(height: context.hp(5)),
                CustomTextField(
                  hint: 'Address IP',
                  controller: ctl.numberIp,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: context.hp(5)),
                CustomButton(
                  text: 'Add devices',
                  onTap: () {
                    ctl.onAdd(ctl.type);
                    nt.pageController.jumpToPage(0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
