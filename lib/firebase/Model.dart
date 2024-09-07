import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  static const String collectionName = "tasks";
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;
  bool? isDone;

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
      dateTime : (data['dateTime'] as Timestamp).toDate(),
      isDone: data['isDone']
  );

  Map<String, Object?> tofirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': Timestamp.fromDate(dateTime!),
      'isDone': isDone,

    };
  }
}
