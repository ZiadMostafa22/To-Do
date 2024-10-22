import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/home/tabs/tasks_tab/Task_Item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(),
      ],
    );
  }
}
