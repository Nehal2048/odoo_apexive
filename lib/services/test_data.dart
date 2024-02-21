import 'package:odoo_apexive/models/project_color_model.dart';
import 'package:odoo_apexive/models/project_model.dart';
import 'package:odoo_apexive/models/task_model.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/shared/const.dart';

List<TimerModel> dummyDataTimer = [
  TimerModel(
    id: "001",
    taskModel: dummyTasks[0],
    favourite: true,
    totalDurationMs: 2000,
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 2)),
    timerDescription:
        "Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end",
    projectModel: dummyProjects[0],
  ),
  TimerModel(
    id: "002",
    taskModel: dummyTasks[0],
    isCompleted: false,
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[1],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "003",
    taskModel: dummyTasks[3],
    isCompleted: true,
    timeElapsedMs: 50000,
    totalDurationMs: 50000,
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 5)),
    projectModel: dummyProjects[2],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "004",
    taskModel: dummyTasks[2],
    favourite: true,
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 0)),
    projectModel: dummyProjects[3],
    timerDescription: "Test Description",
    timeElapsedMs: 10000,
    isCompleted: true,
  ),
  TimerModel(
    id: "005",
    taskModel: dummyTasks[1],
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[5],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "006",
    taskModel: dummyTasks[4],
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[4],
    timeElapsedMs: 150000,
    isCompleted: true,
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "007",
    taskModel: dummyTasks[3],
    isCompleted: true,
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[2],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "008",
    taskModel: dummyTasks[2],
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[3],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "009",
    taskModel: dummyTasks[1],
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[5],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "010",
    taskModel: dummyTasks[3],
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[6],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "011",
    taskModel: dummyTasks[2],
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[2],
    timerDescription: "Test Description",
  ),
  TimerModel(
    id: "012",
    taskModel: dummyTasks[1],
    createdTimeStamp: DateTime.now().subtract(const Duration(days: 1)),
    projectModel: dummyProjects[3],
    timerDescription: "Test Description",
  ),
];

List<ProjectModel> dummyProjects = [
  ProjectModel(
    projectName: 'Project White OOP',
    favourite: true,
    colour: projectColors[0],
  ),
  ProjectModel(
    projectName: 'Project Green EE2',
    favourite: false,
    colour: projectColors[1],
  ),
  ProjectModel(
    projectName: 'Project Red CC6',
    favourite: true,
    colour: projectColors[2],
  ),
  ProjectModel(
    projectName: 'Project Yellow DD5',
    favourite: false,
    colour: projectColors[3],
  ),
  ProjectModel(
    projectName: 'Project Orange AA2',
    favourite: true,
    colour: projectColors[4],
  ),
  ProjectModel(
    projectName: 'Project Light Blue CCC',
    favourite: false,
    colour: projectColors[5],
  ),
  ProjectModel(
    projectName: 'Project Medium Blue',
    favourite: true,
    colour: projectColors[6],
  ),
  ProjectModel(
    projectName: 'Project Dark Blue ABB',
    favourite: false,
    colour: projectColors[7],
  ),
  ProjectModel(
    projectName: 'Project Purple TYY',
    favourite: true,
    colour: projectColors[8],
  ),
  ProjectModel(
    projectName: 'Project Dark Purple ST',
    favourite: false,
    colour: projectColors[9],
  ),
  ProjectModel(
    projectName: 'Project Fushia 5',
    favourite: false,
    colour: projectColors[10],
  ),
  ProjectModel(
    projectName: 'Project Salmon Pink T',
    favourite: false,
    colour: projectColors[11],
  ),
];
List<TaskModel> dummyTasks = [
  TaskModel(
    id: "0001",
    taskName: "Get to know Apexer - Ivan",
    deadline: DateTime.now(),
    assignee: 'Ivan Zhuikov',
    project: dummyProjects[0],
    taskDescription:
        'As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis',
  ),
  TaskModel(
    id: "0002",
    taskName: "Get to know Apexer 1 - Ivan",
    deadline: DateTime.now().add(const Duration(days: 2)),
    assignee: 'Alice Smith',
    project: dummyProjects[2],
    taskDescription: 'Task 2 description',
  ),
  TaskModel(
    id: "0003",
    taskName: "Get to know Apexer 2 - Ivan",
    deadline: DateTime.now().add(const Duration(days: 5)),
    assignee: 'Bob Johnson',
    project: dummyProjects[3],
    taskDescription: 'Task 3 description',
  ),
  TaskModel(
    id: "0004",
    taskName: "Get to know Apexer 3 - Ivan",
    deadline: DateTime.now().add(const Duration(days: 7)),
    assignee: 'Emma Davis',
    project: dummyProjects[1],
    taskDescription: 'Task 4 description',
  ),
  TaskModel(
    id: "0005",
    taskName: "Get to know Apexer 4 - Ivan",
    deadline: DateTime.now().add(const Duration(days: 10)),
    assignee: 'Michael Wilson',
    project: dummyProjects[0],
    taskDescription: 'Task 5 description',
  ),
  TaskModel(
    id: "0006",
    taskName: "Testing Task",
    deadline: DateTime.now().add(const Duration(days: 10)),
    assignee: 'Md. Maknun Nehal',
    project: dummyProjects[0],
    taskDescription: 'Task 5 description',
  ),
];
List<ProjectColor> projectColors = [
  ProjectColor(name: "White", color: white),
  ProjectColor(name: "Green", color: projectColorGreen),
  ProjectColor(name: "Red", color: projectColorRed),
  ProjectColor(name: "Yellow", color: projectColorYellow),
  ProjectColor(name: "Orange", color: projectColorOrange),
  ProjectColor(name: "Light Blue", color: projectColorLightBlue),
  ProjectColor(name: "Medium Blue", color: projectColorMediumBlue),
  ProjectColor(name: "Dark Blue", color: projectColorDarkBlue),
  ProjectColor(name: "Purple", color: projectColorPurple),
  ProjectColor(name: "Dark Purple", color: projectColorDarkPurple),
  ProjectColor(name: "Fushia", color: projectColorFushia),
  ProjectColor(name: "Salmon Pink", color: projectColorSalmonPink),
];
