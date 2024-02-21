import 'package:odoo_apexive/models/project_color_model.dart';

class ProjectModel {
  String projectName;
  bool favourite;
  ProjectColor colour;

  ProjectModel({
    required this.projectName,
    required this.favourite,
    required this.colour,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        projectName: json['projectName'],
        favourite: json['favourite'],
        colour: ProjectColor.fromJson(json['colour']),
      );

  Map<String, dynamic> toJson() => {
        'projectName': projectName,
        'favourite': favourite,
        'colour': colour.toJson(),
      };

  ProjectModel copyWith({
    String? projectName,
    bool? favourite,
    ProjectColor? colour,
  }) {
    return ProjectModel(
      projectName: projectName ?? this.projectName,
      favourite: favourite ?? this.favourite,
      colour: colour ?? this.colour,
    );
  }

  @override
  String toString() {
    return 'ProjectModel('
        'projectName: $projectName, '
        'favourite: $favourite, '
        'colour: $colour'
        ')';
  }
}
