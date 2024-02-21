import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odoo_apexive/models/task_model.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/styles.dart';
import 'package:odoo_apexive/shared/theme.dart';

class TaskDescription extends StatelessWidget {
  final TaskModel taskModel;

  const TaskDescription({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultMarginValue),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: defaultContainerBoxDecoration,
            padding: const EdgeInsets.all(defaultSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TaskDetailsItem(
                    title: "Project",
                    content: taskModel.project.projectName,
                    color: taskModel.project.colour.color),
                const SizedBox(
                  height: defaultSpacing,
                ),
                TaskDetailsItem(
                  title: "Deadline",
                  content: DateFormat("dd/MM/yyy").format(taskModel.deadline),
                ),
                const SizedBox(
                  height: defaultSpacing,
                ),
                TaskDetailsItem(
                  title: "Assigned to",
                  content: taskModel.assignee,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: defaultGap,
          ),
          Container(
            width: double.infinity,
            decoration: defaultContainerBoxDecoration,
            padding: const EdgeInsets.all(defaultSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description",
                  style: textTheme.bodySmall,
                ),
                Text(
                  taskModel.taskDescription,
                  style: textTheme.titleSmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskDetailsItem extends StatelessWidget {
  final String content;
  final Color? color;
  final String title;

  const TaskDetailsItem(
      {super.key, required this.content, this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodySmall,
        ),
        color != null
            ? Row(
                children: [
                  SizedBox(
                    height: 24,
                    child: VerticalDivider(
                      width: 2,
                      thickness: 2,
                      color: color,
                    ),
                  ),
                  const SizedBox(
                    width: defaultGap,
                  ),
                  Text(
                    content,
                    style: textTheme.titleMedium,
                  ),
                ],
              )
            : Text(
                content,
                style: textTheme.titleMedium,
              ),
      ],
    );
  }
}
