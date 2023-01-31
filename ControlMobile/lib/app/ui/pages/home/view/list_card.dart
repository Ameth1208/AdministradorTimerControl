import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_control/app/ui/widgets/custom_card.dart';
import '../controller/global_controller.dart';

class ListCard extends HookConsumerWidget {
  const ListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(homeProvider);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < 10; i++)
              CustomCard(
                index: 0,
                text: 'ArCars ${i + 1}',
                state: Random().nextInt(3),
                tapIndex: (i) {},
              )
          ],
        ),
      ],
    );
  }
}
