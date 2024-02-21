import 'package:flutter/material.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/screens/task_details/task_details_details.dart';
import 'package:odoo_apexive/screens/task_details/task_details_timesheet.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/theme.dart';

import '../../blocs/bloc_exports.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TimerModel timerModel;

  const TaskDetailsScreen({
    super.key,
    required this.timerModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimersBloc, TimersState>(
      builder: (context, state) {
        List<TimerModel> timersList = state.listTimers;

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                timerModel.taskModel!.taskName,
                style: textTheme.titleMedium,
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                enableFeedback: false,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                const SizedBox(
                  width: defaultMarginValue,
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, defaultButtonHeight),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 15),
                  child: const TabBar(
                    tabs: [
                      Tab(
                        text: "Timesheets",
                      ),
                      Tab(
                        text: "Details",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                TaskTimeSheet(
                  timerModels: timersList
                      .where((e) => e.taskModel?.id == timerModel.taskModel?.id)
                      .toList(),
                ),
                TaskDescription(
                  taskModel: timerModel.taskModel!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
