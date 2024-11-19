class TodoDM {
  static const collectionName = 'todo';
   String id;
   String title;
   String description;
   DateTime dateTime;
   bool isDone;

  TodoDM({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isDone,
  });

  // Convert the object to a map for Firestore
  Map<String, dynamic> toFireStore() => {
    'id': id, //
    'title': title,
    'description': description,
    'dateTime': dateTime,
    'isDone': isDone,
  };

  // Convert Firestore document to TodoDM
  TodoDM.fromFireStore(Map<String, dynamic> data)
      : this(
    id: data['id'],
    title: data['title'],
    description: data['description'],
    dateTime: data['dateTime'].toDate() ,  // Convert Timestamp to DateTime
    isDone: data['isDone'],
  );
}
