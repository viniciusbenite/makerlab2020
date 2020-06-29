import 'package:makerlab/models/equipment.dart';

class Project {
  int code;
  String shortName;
  String name;
  int year;
  int semester;
  Equipment equipment;

  Project(
      {this.code,
      this.shortName,
      this.name,
      this.year,
      this.semester,
      this.equipment});

  factory Project.fromJson(Map<String, dynamic> json) => new Project(
        code: json['code'],
        shortName: json['short_name'],
        name: json['name'],
        year: json['year'],
        semester: json['semester'],
        equipment: json['year'],
      );
}
