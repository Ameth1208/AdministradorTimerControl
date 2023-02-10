import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/pages/add/controller/global_controller.dart';
import 'package:timer_control/app/ui/pages/add/view/content_img.dart';
import 'package:timer_control/app/ui/pages/home/controller/global_controller.dart';
import 'package:timer_control/app/ui/pages/navigator/controller/global_controller.dart';

import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class AddItemList extends HookConsumerWidget {
  const AddItemList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(addDevicesProvider);
    final nt = ref.watch(navigatorProvider);
    final cth = ref.watch(homeProvider);
    final size = MediaQuery.of(context).size;
    final bool visible;
    if (size.width < size.height) {
      visible = true;
    } else {
      visible = false;
    }

    final List<Widget> listWidgets = [
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
        onTap: () async {
          ctl.onAdd(ctl.type);
          ctl.type = 0;
          nt.onPage(0);
          cth.onData();
        },
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(context.dp(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.hp(2)),
          const CustomTextView.h2(text: 'Select Devices'),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: context.hp(5)),
                Visibility(
                  visible: visible,
                  replacement: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(child: ContentImg(w: 30)),
                      SizedBox(width: context.wp(5)),
                      SizedBox(
                          width: context.wp(40),
                          child: Column(children: listWidgets)),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: context.hp(5)),
                      const Center(child: ContentImg(w: 50)),
                      Column(children: listWidgets)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
