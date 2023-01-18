import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:timer_control/app/ui/widgets/global_widgets.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.text = 'ArCars 1',
    this.ipText = '192.168.1.100',
    this.color = CustomColors.stateLibre,
    this.visible = true,
    required this.index,
    required this.idTap,
    required this.unLock,
    required this.time,
    required this.lock,
  });

  final String text;
  final String ipText;
  final Color color;

  final bool visible;
  final OnTapIndex idTap;
  final OnTapIndex unLock;
  final OnTapIndex time;
  final OnTapIndex lock;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        idTap(index);
      },
      child: Container(
        width: context.wp(90),
        padding: EdgeInsets.symmetric(
            horizontal: context.wp(3), vertical: context.hp(2)),
        margin: EdgeInsets.symmetric(
            horizontal: context.wp(3), vertical: context.hp(2)),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(context.dp(1)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 12,
              color: CustomColors.primary.withOpacity(0.05),
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: context.wp(1)),
              title: CustomTextView.h2(
                fontWeight: FontWeight.w800,
                text: text,
              ),
              subtitle: CustomTextView.h3(
                text: ipText,
                color: CustomColors.primary_100,
              ),
              trailing: StateCard(
                color: color,
              ),
            ),
            SizedBox(height: context.hp(1)),
            Visibility(
              key: ValueKey('$visible'),
              visible: visible,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                      color: CustomColors.unlock,
                      onTap: () {
                        unLock(index);
                      },
                      icon: Icons.lock_open_rounded),
                  CustomButton(
                    color: CustomColors.time,
                    onTap: () {
                      time(index);
                    },
                    icon: CupertinoIcons.clock,
                  ),
                  CustomButton(
                    color: CustomColors.stateLock,
                    onTap: () {
                      lock(index);
                    },
                    icon: Icons.lock_outline,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.hp(1)),
          ],
        ),
      ),
    );
  }
}

class StateCard extends StatelessWidget {
  const StateCard({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dp(2),
      height: context.dp(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            context.dp(1),
          ),
          color: color),
    );
  }
}

typedef OnTapIndex = Function(int i);
