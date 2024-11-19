import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:todo/core/utils/app_styles.dart';
import 'package:todo/databsae_manager/model/todo_dm.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();

  static Widget show() => TaskBottomSheet();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            style: AppLightStyles.appBarTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Enter your task title'),
              style: AppLightStyles.hintStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: 'Enter description'),
              style: AppLightStyles.hintStyle,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Select Date',
            style: AppLightStyles.dateLabel,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showTaskDatePicker(context);
            },
            child: Text(
              // Format the selectedDate to a readable string
              DateFormat('yyyy-MM-dd').format(selectedDate),
              // This formats the date
              textAlign: TextAlign.center,
              style: AppLightStyles.datePicker,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              addTasktoFirestore();
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }

  void showTaskDatePicker(BuildContext context) async {
    selectedDate = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ) ?? selectedDate;

    setState(() {});
  }

  void addTasktoFirestore() {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection(TodoDM.collectionName);
    DocumentReference documentReference = collectionReference.doc();
    TodoDM todo = TodoDM(
      id: documentReference.id,
      title: titleController.text,
      dateTime: selectedDate,
      description: descriptionController.text,
      isDone: false,
    );

    documentReference.set(todo.toFireStore()).then((_) {

    },).onError((error, stackTrace) {

    },).timeout(Duration(milliseconds: 500), onTimeout: () {
      if (mounted) {
        Navigator.pop(context);
      }
    },);
  }
}
