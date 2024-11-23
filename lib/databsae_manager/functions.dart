import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/databsae_manager/model/todo_dm.dart';

class FirebaseFunction {

 static CollectionReference getCollection()
{
  CollectionReference todoCollection =  FirebaseFirestore.instance.collection(TodoDM.collectionName);
  return todoCollection;
}


static Future <void> updateTask(TodoDM todo) async {
  CollectionReference todoCollection = getCollection();
  DocumentReference todoDoc =  todoCollection.doc(todo.id);
 await todoDoc.update(todo.toFireStore());
}

}