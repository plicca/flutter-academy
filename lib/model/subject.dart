class Subject {
  final int id;
  final String name;
  final String description;

  Subject({this.id, this.name, this.description});

  factory Subject.fromJson(Map<String, dynamic> json) {
    //print(json.values);
    return Subject(
      id: json['ID'],
      name : json['Name'],
      description : json['Description'],
    );
  }
}