class TaskModel {
  String? id;
  String? title;
  String? description;
  int? date;
  bool? isDone;

  TaskModel(
      {required this.date,
      required this.description,
      this.id = '',
      this.isDone = false,
      required this.title});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            date: json['date'],
            description: json['description'],
            title: json['title'],
            id: json['id'],
            isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {
      "date": [date],
      "description": [description],
      "title": [title],
      "id": [id],
      "isDone": [isDone]
    };
  }
}
