import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'controller/global_controller.dart';
import 'view/list_card.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class HomeMobile extends HookConsumerWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final controller = ref.watch(homeProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomButton(
          onTap: () {
            showAlertDialog(context, ref);
          },
        ),
        body: Container(
          alignment: Alignment.center,
          child: const ListCard(),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, WidgetRef ref) {
  final controller = ref.watch(homeProvider);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(context.dp(1)),
        title: const CustomTextView.h1(
          text: 'Añadir maquina',
        ),
        content: SizedBox(
          height: context.hp(32),
          child: Column(
            children: [
              CustomTextField(
                hint: 'Nombre del dispositivo',
                controller: controller.nameDevice,
              ),
              SizedBox(height: context.hp(1)),
              CustomTextField(
                hint: 'Direccion del dispositvo',
                controller: controller.numberIp,
                textInputType: TextInputType.number,
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  if (controller.nameDevice.text.isNotEmpty ||
                      controller.numberIp.text.isNotEmpty) {
                    controller.onAdd();
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
