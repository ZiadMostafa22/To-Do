import 'package:flutter/material.dart';
import 'package:todo/core/utils/assets_manager.dart';
import 'package:todo/core/utils/string_manager.dart';
import 'package:todo/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:todo/presentation/screens/home/tabs/tasks_tab/tasks_tab.dart';
import 'package:todo/presentation/screens/home/task_bottom_sheet/task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List <Widget> tabs = [
    TasksTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[currentIndex],
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      floatingActionButton: buildFloatActionButton(),
      bottomNavigationBar: buildBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  buildBottomNavBar() => BottomAppBar(
    notchMargin: 8,
    child: BottomNavigationBar(

      backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            iconSize: 35,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: StringManager.listLabel),

              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: StringManager.settingsLabel),
            ]),
  );

  buildFloatActionButton() => FloatingActionButton(
        onPressed: () {
          showTaskBottomSheet();
        },
        child:const Icon(Icons.add ,size: 35,),
      );




  void showTaskBottomSheet() {
 showModalBottomSheet(context: context, builder: (context) => TaskBottomSheet.show(),);
  }


// void onTapped (int index)
// {
//   currentIndex=index;
//   setState(() {
//
//   });
// }
//
}


