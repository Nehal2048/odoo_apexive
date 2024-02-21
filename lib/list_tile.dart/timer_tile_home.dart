import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:odoo_apexive/blocs/bloc_exports.dart';
import 'package:odoo_apexive/list_tile.dart/icon_text_timer_tile.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/screens/task_details/task_details_screen.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/styles.dart';
import 'package:odoo_apexive/shared/theme.dart';

class TimerTileHome extends StatelessWidget {
  final TimerModel timerModel;

  TimerTileHome({super.key, required this.timerModel});

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        timer?.cancel();
        timer = null;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(
              timerModel: timerModel,
            ),
          ),
        );
      },
      onLongPress: () {
        timer?.cancel();
        timer = null;
        context.read<TimersBloc>().add(DeleteTimer(timerModel: timerModel));
      },
      customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: Container(
        decoration: defaultContainerBoxDecoration,
        padding: const EdgeInsets.all(defaultSpacing),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
              child: VerticalDivider(
                width: 2,
                thickness: 2,
                color: timerModel.projectModel?.colour.color,
              ),
            ),
            const SizedBox(
              width: defaultGap,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconTextTimerTile(
                    style: themeDataLight.textTheme.titleMedium!.copyWith(
                      height: 0,
                    ),
                    iconData: timerModel.favourite
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    text: timerModel.taskModel?.taskName ?? "",
                  ),
                  IconTextTimerTile(
                    iconData: MdiIcons.briefcaseOutline,
                    text: timerModel.projectModel?.projectName ?? "",
                  ),
                  IconTextTimerTile(
                    iconData: Icons.access_time_outlined,
                    text:
                        "Deadline: ${DateFormat("dd/MM/yyy").format(timerModel.taskModel?.deadline ?? DateTime.now())}",
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: defaultGap,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!timerModel.isCompleted) {
                  context.read<TimersBloc>().add(UpdateTimerPausePlay(
                        timerModel: timerModel,
                      ));
                  if (!timerModel.isActive && !timerModel.isCompleted) {
                    timer?.cancel();
                    timer = null;
                    timer =
                        Timer.periodic(const Duration(seconds: 1), (Timer t) {
                      context.read<TimersBloc>().add(IncrementOneSecondTimer(
                            timerModel: timerModel,
                          ));
                    });
                  } else {
                    timer?.cancel();
                    timer = null;
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64),
                ),
                elevation: 0,
                backgroundColor:
                    timerModel.isActive ? Colors.white : surfaceColors[1],
              ),
              child: Row(
                children: [
                  Text(
                    timerModel.getFormattedTimeElapsed(),
                    style: themeDataLight.textTheme.labelLarge!.copyWith(
                      height: 0,
                      color: timerModel.isActive ? Colors.black : white,
                    ),
                  ),
                  if (!timerModel.isCompleted)
                    Icon(
                      timerModel.isActive ? Icons.play_arrow : Icons.pause,
                      size: 16,
                      color: timerModel.isActive ? Colors.black : white,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
