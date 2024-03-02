import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/model/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel>
      getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data() ?? {});
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }

  static void addTask(TaskModel task) {
    var collection = getTasksCollection();
    //to generate auto id
    var doc = collection.doc();
    // to save the id in the task before sending
    task.id = doc.id;
    print(task.title);
    doc.set(task);
  }
}
