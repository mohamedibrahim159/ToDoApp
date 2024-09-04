class Task {
  static const String collectionName = "tasks";
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  Task.fromfirestore(Map<String, dynamic> data)
      : this(
      id : data['id'] as String,
      title : data['title'] as String,
      description : data['description'] as String,
      dateTime : DateTime.fromMicrosecondsSinceEpoch(data['dateTime']),
      isDone: data['isDone']
  );

  Map<String, Object?> tofirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'isDone': isDone,

    };
  }
}
