import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/styles.dart';
import 'package:odoo_apexive/shared/theme.dart';
import 'package:odoo_apexive/blocs/bloc_exports.dart';

class TimerTileTask extends StatefulWidget {
  final bool isMain;
  final bool isExpanded;
  final TimerModel timerModel;

  const TimerTileTask({
    super.key,
    required this.timerModel,
    this.isMain = false,
    this.isExpanded = false,
  });

  @override
  State<TimerTileTask> createState() => _TimerTileTaskState();
}

class _TimerTileTaskState extends State<TimerTileTask> {
  bool isExpanded = false;
  Timer? timer;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius)),
      onTap: widget.isMain
          ? null
          : () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
      child: Container(
        decoration: defaultContainerBoxDecoration,
        padding: const EdgeInsets.all(defaultSpacing),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isMain) ...[
                Text(
                  DateFormat("EEEE").format(widget.timerModel.createdTimeStamp),
                  style: textTheme.bodySmall,
                ),
                Text(
                  DateFormat("dd.mm.yyyy")
                      .format(widget.timerModel.createdTimeStamp),
                  style: textTheme.titleSmall,
                ),
                Text(
                  "Start Time ${widget.timerModel.getFormattedTimeDuration()}",
                  style: textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Text(
                      widget.timerModel.getFormattedTimeElapsed(),
                      style: textTheme.displaySmall,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        timer?.cancel();
                        timer = null;
                        context.read<TimersBloc>().add(
                              UpdateTimerMarkCompleted(
                                timerModel: widget.timerModel,
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            themeLightColorScheme.secondaryContainer,
                      ),
                      icon: const Icon(
                        Icons.stop_rounded,
                        color: white,
                      ),
                    ),
                    const SizedBox(
                      width: defaultSpacing,
                    ),
                    IconButton(
                      onPressed: () {
                        if (!widget.timerModel.isCompleted) {
                          context.read<TimersBloc>().add(UpdateTimerPausePlay(
                                timerModel: widget.timerModel,
                              ));
                          if (!widget.timerModel.isActive &&
                              !widget.timerModel.isCompleted) {
                            timer?.cancel();
                            timer = null;
                            timer = Timer.periodic(const Duration(seconds: 1),
                                (Timer t) {
                              context.read<TimersBloc>().add(
                                    IncrementOneSecondTimer(
                                      timerModel: widget.timerModel,
                                    ),
                                  );
                            });
                          } else {
                            timer?.cancel();
                            timer = null;
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                      ),
                      icon: Icon(
                        widget.timerModel.isActive
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ] else
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_sharp,
                    ),
                    const SizedBox(
                      width: defaultGap,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat("EEEE")
                              .format(widget.timerModel.createdTimeStamp),
                          style: textTheme.bodySmall,
                        ),
                        Text(
                          DateFormat("dd.MM.yyyy")
                              .format(widget.timerModel.createdTimeStamp),
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          "Start Time: ${widget.timerModel.getFormattedTimeDuration()}",
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(64),
                        ),
                        elevation: 0,
                        backgroundColor:
                            themeLightColorScheme.secondaryContainer,
                      ),
                      child: Text(
                        widget.timerModel.getFormattedTimeElapsed(),
                        style: themeDataLight.textTheme.labelLarge!.copyWith(
                          height: 0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              if (isExpanded || widget.isMain) ...[
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description",
                      style: textTheme.bodySmall,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                Text(
                  widget.timerModel.timerDescription,
                  style: textTheme.bodyMedium,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
