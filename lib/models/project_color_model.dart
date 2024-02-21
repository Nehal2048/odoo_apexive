import 'package:flutter/material.dart';

class ProjectColor {
  String name;
  Color color;

  ProjectColor({
    required this.name,
    required this.color,
  });

  factory ProjectColor.fromJson(Map<String, dynamic> json) {
    return ProjectColor(
      name: json['name'],
      color: Color(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': color.value,
    };
  }

  @override
  String toString() {
    return 'ProjectColor{name: $name, color: $color}';
  }

  ProjectColor copyWith({
    String? name,
    Color? color,
  }) {
    return ProjectColor(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}
