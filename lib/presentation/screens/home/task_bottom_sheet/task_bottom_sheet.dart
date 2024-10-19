import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/app_styles.dart';
import 'package:todo/core/utils/date_utils.dart';

import 'Widgets/TextFields.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();

  static Widget show() => TaskBottomSheet();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
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
            textFieldsWidget(
              hintText: 'Enter Task Title',
            ),
            textFieldsWidget(
              hintText: 'Enter Task Description',
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
              onTap:() {
                showTaskDatePicker(context);

              },
                child: Text(
                  selectedDate.toFormattedDate,
                  textAlign: TextAlign.center,style: AppLightStyles.datePicker,
                )),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Add Task'))
          ],
        ),
      ),
    );
  }

  void showTaskDatePicker(BuildContext context) async
  {
    selectedDate = await showDatePicker(
      initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100)) ?? selectedDate;

    setState(() {

    });
  }
}
