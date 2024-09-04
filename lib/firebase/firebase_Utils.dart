import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Model.dart';

class firebaseUtils {
  static CollectionReference<Task> getTaskcollection() {
    return FirebaseFirestore.instance.collection(Task.collectionName)
        .withConverter<Task>(
      fromFirestore: (snapshot, options) => Task.fromfirestore(snapshot.data()!)
      , toFirestore: (task, options) => task.tofirestore(),
    );
  }
  static Future<void>addTaskToFirestore(Task task){
    var taskcollectionRef=getTaskcollection();
    DocumentReference<Task>taskDocRef=taskcollectionRef.doc();
    task.id=taskcollectionRef.id;
    return taskDocRef.set(task);

  }

}