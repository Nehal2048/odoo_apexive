import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/screens/time_sheet_screen.dart';
import 'package:odoo_apexive/screens/create_timer_screen.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/styles.dart';
import 'package:odoo_apexive/shared/theme.dart';
import 'package:odoo_apexive/shared/widgets.dart';

import '../blocs/bloc_exports.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimersBloc, TimersState>(
      builder: (context, state) {
        if (state is TimersStateFailure) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
              child: const ErrorWidgetCustom(),
            ),
          );
        }

        if (state is TimersStateLoading || state is TimersStateInitial) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
              child: const Loading(),
            ),
          );
        }

        List<TimerModel> timersList = state.listTimers;

        return DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Timesheets",
                style: themeDataLight.textTheme.headlineLarge,
              ),
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, defaultButtonHeight),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 15),
                  child: const TabBar(
                    tabs: [
                      Tab(
                        text: "Favorites",
                      ),
                      Tab(
                        text: "Odoo",
                      ),
                      Tab(
                        text: "Local",
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                SizedBox(
                  height: defaultButtonHeight,
                  width: defaultButtonHeight,
                  child: IconButton.filled(
                    onPressed: () =>
                        _showSortModalSheet(context, state.isRecentFirst),
                    icon: Icon(
                      MdiIcons.arrowUpDown,
                    ),
                    style: appBarActionButtonFilledStyle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: defaultButtonHeight,
                  width: defaultButtonHeight,
                  child: IconButton.filled(
                    onPressed: () => _goToAddTaskPage(context),
                    icon: const Icon(
                      Icons.add,
                    ),
                    style: appBarActionButtonFilledStyle,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            body: TabBarView(
              children: [
                TimeSheetPage(
                  timers:
                      timersList.where((element) => element.favourite).toList(),
                ),
                TimeSheetPage(
                  timers: timersList,
                ),
                TimeSheetPage(
                  timers: timersList,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goToAddTaskPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateTimerPage(),
      ),
    );
  }

  void _showSortModalSheet(BuildContext context, bool isRecentFirst) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(defaultMarginValue),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sort By",
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: defaultSpacing,
              ),
              InkWell(
                onTap: () {
                  context.read<TimersBloc>().add(const SortTimersEvent(true));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 24,
                      color: isRecentFirst ? Colors.white : Colors.transparent,
                    ),
                    Text(
                      "  Recent",
                      style: textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultGap,
              ),
              const Divider(),
              const SizedBox(
                height: defaultGap,
              ),
              InkWell(
                onTap: () {
                  context.read<TimersBloc>().add(const SortTimersEvent(false));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 24,
                      color: isRecentFirst ? Colors.transparent : Colors.white,
                    ),
                    Text(
                      "  Oldest",
                      style: textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultGap,
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
