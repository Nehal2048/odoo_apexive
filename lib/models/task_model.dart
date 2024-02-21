import 'package:odoo_apexive/models/project_model.dart';

class TaskModel {
  String id;
  String taskName;
  DateTime deadline;
  String assignee;
  ProjectModel project;
  String taskDescription;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.deadline,
    required this.assignee,
    required this.project,
    required this.taskDescription,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        taskName: json['taskName'],
        deadline: DateTime.parse(json['deadline']),
        assignee: json['assignee'],
        project: ProjectModel.fromJson(json['project']),
        taskDescription: json['taskDescription'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'taskName': taskName,
        'deadline': deadline.toIso8601String(),
        'assignee': assignee,
        'project': project.toJson(),
        'taskDescription': taskDescription,
      };

  TaskModel copyWith({
    String? id,
    String? taskName,
    DateTime? deadline,
    String? assignee,
    ProjectModel? project,
    String? taskDescription,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      deadline: deadline ?? this.deadline,
      assignee: assignee ?? this.assignee,
      project: project ?? this.project,
      taskDescription: taskDescription ?? this.taskDescription,
    );
  }

  @override
  String toString() {
    return 'TaskModel('
        'id: $id, '
        'taskName: $taskName, '
        'deadline: $deadline, '
        'assignee: $assignee, '
        'project: $project, '
        'taskDescription: $taskDescription'
        ')';
  }
}
