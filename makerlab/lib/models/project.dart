class Project {
  int code;
  String shortName;
  String name;
  int year;
  int semester;
  List<dynamic> equipment;

  Project({this.code,
    this.shortName,
    this.name,
    this.year,
    this.semester,
    this.equipment});

  factory Project.fromJson(Map<String, dynamic> json) =>
    new Project(
      code: json['code'],
      shortName: json['short_name'],
      name: json['name'],
      year: json['year'],
      semester: json['semester'],
      equipment: json['equipment'],
      );

  Map<String, dynamic> toMap() =>
    {
      'code': code,
      'short_name': shortName,
      'name': name,
      'year': year,
      'semester': semester,
      'equipment': equipment,
    };
}
