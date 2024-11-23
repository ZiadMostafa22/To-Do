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
  GlobalKey<FormState> formKey = GlobalKey(); // Single Form key


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
          SizedBox(height: 5),
          Form(
            key: formKey, // Single Form wrapping both fields
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Please Enter Task Title';
                      }
                      if (input.length < 6 )
                        {
                          return 'Sorry, Title Must be 6 characters';
                        }
                      return null;
                    },
                    controller: titleController,
                    decoration:InputDecoration(
                      hintText: 'Enter your task title',
                    ),
                    style: AppLightStyles.hintStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Please Enter Task Description';
                      }
                      if (input.length < 6 )
                      {
                        return 'Sorry, Description Must be 6 characters';
                      }
                      return null;
                    },
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Enter description',
                    ),
                    style: AppLightStyles.hintStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Select Date',
            style: AppLightStyles.dateLabel,
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showTaskDatePicker(context);
            },
            child: Text(
              DateFormat('yyyy-MM-dd').format(selectedDate),
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
    ) ??
        selectedDate;

    setState(() {});
  }

  void addTasktoFirestore() {
    if (formKey.currentState?.validate() == false) return;

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

    documentReference.set(todo.toFireStore()).then(
          (_) {},
    ).onError(
          (error, stackTrace) {},
    ).timeout(
      Duration(milliseconds: 500),
      onTimeout: () {
        if (mounted) {
          Navigator.pop(context);

        }
      },
    );
  }
}
