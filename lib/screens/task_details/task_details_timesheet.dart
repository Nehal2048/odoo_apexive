import 'package:flutter/material.dart';
import 'package:odoo_apexive/list_tile.dart/timer_tile_task.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/theme.dart';

class TaskTimeSheet extends StatefulWidget {
  final List<TimerModel> timerModels;

  const TaskTimeSheet({
    super.key,
    required this.timerModels,
  });

  @override
  State<TaskTimeSheet> createState() => _TaskTimeSheetState();
}

class _TaskTimeSheetState extends State<TaskTimeSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultMarginValue),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: defaultGap,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.timerModels
                  .where((e) => !e.isCompleted)
                  .toList()
                  .length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return TimerTileTask(
                  timerModel: widget.timerModels
                      .where((e) => !e.isCompleted)
                      .toList()[index],
                  isMain: true,
                );
              },
            ),
            const SizedBox(
              height: defaultSpacing,
            ),
            if (widget.timerModels.where((e) => e.isCompleted).isNotEmpty) ...[
              Text(
                "Completed Records",
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: defaultGap,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: defaultGap,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.timerModels
                    .where((e) => e.isCompleted)
                    .toList()
                    .length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return TimerTileTask(
                    timerModel: widget.timerModels
                        .where((e) => e.isCompleted)
                        .toList()[index],
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
