import 'package:flutter/material.dart';
import 'package:odoo_apexive/blocs/bloc_exports.dart';
import 'package:odoo_apexive/models/project_model.dart';
import 'package:odoo_apexive/models/task_model.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/services/test_data.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/theme.dart';

class CreateTimerPage extends StatefulWidget {
  const CreateTimerPage({super.key});

  @override
  State<CreateTimerPage> createState() => _CreateTimerPageState();
}

class _CreateTimerPageState extends State<CreateTimerPage> {
  final _formKey = GlobalKey<FormState>();

  TimerModel timerModel = TimerModel(
    id: DateTime.now().toString(),
    taskModel: null,
    projectModel: null,
    timerDescription: "",
    createdTimeStamp: DateTime.now(),
    totalDurationMs: 600000,
    timeElapsedMs: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Timer",
          style: textTheme.headlineSmall,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          enableFeedback: false,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultMarginValue),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onLongPress: () {
                        timerModel.projectModel = null;
                      },
                      child: DropdownButtonFormField<ProjectModel>(
                        decoration: const InputDecoration(
                          labelText: "Project",
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Enter a value";
                          }
                          return null;
                        },
                        items: dummyProjects.map((ProjectModel value) {
                          return DropdownMenuItem<ProjectModel>(
                            value: value,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: value.colour.color,
                                  radius: 5,
                                ),
                                const SizedBox(
                                  width: defaultGap,
                                ),
                                Text(
                                  value.projectName,
                                  style:
                                      textTheme.bodyLarge!.copyWith(height: 0),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: white,
                        ),
                        value: timerModel.projectModel,
                        onChanged: (selection) {
                          setState(() {
                            timerModel.projectModel = selection;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    InkWell(
                      onLongPress: () {
                        timerModel.taskModel = null;
                      },
                      child: DropdownButtonFormField<TaskModel>(
                        decoration: const InputDecoration(
                          labelText: "Task",
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Enter a value";
                          }
                          return null;
                        },
                        items: dummyTasks.map((TaskModel value) {
                          return DropdownMenuItem<TaskModel>(
                            value: value,
                            child: Text(
                              value.taskName,
                              style: textTheme.bodyLarge!.copyWith(height: 0),
                            ),
                          );
                        }).toList(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: white,
                        ),
                        value: timerModel.taskModel,
                        onChanged: (selection) {
                          setState(() {
                            timerModel.taskModel = selection;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    TextFormField(
                      enableInteractiveSelection: true,
                      decoration: const InputDecoration(
                        labelText: "Description",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field Cannot Be Empty';
                        }
                        return null;
                      },
                      initialValue: timerModel.timerDescription,
                      onChanged: ((value) => setState(() {
                            timerModel.timerDescription = value.trim();
                          })),
                      maxLines: null,
                    ),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: timerModel.favourite,
                          onChanged: (newValue) {
                            setState(() {
                              timerModel.favourite = newValue ?? false;
                            });
                          },
                        ),
                        const SizedBox(
                          height: defaultGap,
                        ),
                        const Text('Make Favourite'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(defaultMarginValue),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<TimersBloc>().add(
                              AddTimer(timerModel: timerModel),
                            );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Create Timer"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
