import 'package:equatable/equatable.dart';
import 'package:odoo_apexive/models/project_model.dart';
import 'package:odoo_apexive/models/task_model.dart';

class TimerModel extends Equatable {
  final String id;
  TaskModel? taskModel;
  ProjectModel? projectModel;
  String timerDescription;
  DateTime createdTimeStamp;
  bool favourite;
  bool isCompleted;
  bool isActive;
  int totalDurationMs;
  int timeElapsedMs;

  TimerModel({
    required this.id,
    required this.taskModel,
    required this.projectModel,
    this.favourite = false,
    this.isCompleted = false,
    this.timerDescription = "",
    required this.createdTimeStamp,
    this.isActive = false,
    this.totalDurationMs = 600000,
    this.timeElapsedMs = 0,
  });

  @override
  List<Object?> get props => [
        id,
        taskModel,
        projectModel,
        timerDescription,
        createdTimeStamp,
        favourite,
        isCompleted,
        isActive,
        totalDurationMs,
        timeElapsedMs,
      ];

  String getFormattedTimeElapsed() {
    return getFormattedTime(totalDurationMs - timeElapsedMs);
  }

  String getFormattedTimeRemaining() {
    return getFormattedTime(timeElapsedMs);
  }

  String getFormattedTimeDuration() {
    return getFormattedTime(totalDurationMs);
  }

  String getFormattedTime(ms) {
    Duration duration = Duration(milliseconds: ms);

    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    String returnStr = "";

    if (hours <= 0) {
      returnStr += "";
    } else if (hours <= 0) {
      returnStr += "0$hours:";
    } else {
      returnStr += "$hours:";
    }

    if (minutes < 10) {
      returnStr += "0$minutes";
    } else {
      returnStr += "$minutes";
    }

    if (seconds < 10) {
      returnStr += ":0$seconds";
    } else {
      returnStr += ":$seconds";
    }

    return returnStr;
  }

  factory TimerModel.fromJson(Map<String, dynamic> json) => TimerModel(
        id: json['id'],
        taskModel: TaskModel.fromJson(json['taskModel']),
        projectModel: ProjectModel.fromJson(json['projectModel']),
        timerDescription: json['timerDescription'],
        createdTimeStamp: DateTime.parse(json['createdTimeStamp']),
        favourite: json['favourite'],
        isCompleted: json['isCompleted'],
        isActive: json['isActive'],
        totalDurationMs: json['totalDurationMs'],
        timeElapsedMs: json['timeElapsedMs'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'taskModel': taskModel?.toJson(),
        'projectModel': projectModel?.toJson(),
        'timerDescription': timerDescription,
        'createdTimeStamp': createdTimeStamp.toIso8601String(),
        'favourite': favourite,
        'isCompleted': isCompleted,
        'isActive': isActive,
        'totalDurationMs': totalDurationMs,
        'timeElapsedMs': timeElapsedMs,
      };

  TimerModel copyWith({
    String? id,
    TaskModel? taskModel,
    ProjectModel? projectModel,
    String? timerDescription,
    DateTime? createdTimeStamp,
    bool? favourite,
    bool? isCompleted,
    bool? isActive,
    int? totalDurationMs,
    int? timeElapsedMs,
  }) {
    return TimerModel(
      id: id ?? this.id,
      taskModel: taskModel ?? this.taskModel,
      projectModel: projectModel ?? this.projectModel,
      timerDescription: timerDescription ?? this.timerDescription,
      createdTimeStamp: createdTimeStamp ?? this.createdTimeStamp,
      favourite: favourite ?? this.favourite,
      isCompleted: isCompleted ?? this.isCompleted,
      isActive: isActive ?? this.isActive,
      totalDurationMs: totalDurationMs ?? this.totalDurationMs,
      timeElapsedMs: timeElapsedMs ?? this.timeElapsedMs,
    );
  }

  @override
  String toString() {
    return 'TimerModel('
        'id: $id, '
        'taskModel: $taskModel, '
        'projectModel: $projectModel, '
        'timerDescription: $timerDescription, '
        'createdTimeStamp: $createdTimeStamp, '
        'favourite: $favourite, '
        'isCompleted: $isCompleted, '
        'isActive: $isActive, '
        'totalDurationMs: $totalDurationMs, '
        'timeElapsedMs: $timeElapsedMs'
        ')';
  }
}
