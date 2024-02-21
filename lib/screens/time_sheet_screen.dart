import 'package:flutter/material.dart';
import 'package:odoo_apexive/list_tile.dart/timer_tile_home.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/theme.dart';

class TimeSheetPage extends StatelessWidget {
  final List<TimerModel> timers;

  const TimeSheetPage({super.key, required this.timers});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundGradient,
      ),
      height: double.infinity,
      padding: const EdgeInsets.all(defaultMarginValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You have ${timers.length} Timers",
            style: themeDataLight.textTheme.labelLarge!.copyWith(height: 0),
          ),
          const SizedBox(
            height: defaultSpacing,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: defaultGap,
              ),
              itemCount: timers.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return TimerTileHome(
                  timerModel: timers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
