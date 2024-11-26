import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/presentation/screens/home/tabs/tasks_tab/Task_Item.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../databsae_manager/model/todo_dm.dart';

class TasksTab extends StatefulWidget {
 TasksTab({super.key});

@override
State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime calenderSelectedDate = DateTime.now();
  List<TodoDM> todoslist = [];

  @override
  void initState() {
    super.initState();
    getTodosFromFireStore();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Column(
          children: [
            buildCalenderTimeLine(),
            SizedBox(height: 30.h),

           Expanded(
             child: ListView.builder(itemBuilder: (context, index) {
               return TaskItem(todo: todoslist[index], onDeletedTask:()
                 {
                   getTodosFromFireStore();
                 },);

             },
              itemCount: todoslist.length,),
           )
          ],
        );
      },
    );
  }

  Widget buildCalenderTimeLine() => EasyDateTimeLine(
    initialDate: DateTime.now(),
    onDateChange: (selectedDate) {
        calenderSelectedDate=selectedDate;
        getTodosFromFireStore(); // Fetch tasks for the selected date
    },
    headerProps: const EasyHeaderProps(
      monthPickerType: MonthPickerType.dropDown,
      dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
    ),
    dayProps: EasyDayProps(
      height: 79,
      dayStructure: DayStructure.dayStrDayNum,
      activeDayStyle: DayStyle(
        dayNumStyle: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.blue,
        ),
        dayStrStyle: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.blue,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: ColorsManager.white,
        ),
      ),
      inactiveDayStyle: DayStyle(
        dayNumStyle: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.black,
        ),
        dayStrStyle: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.black,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: ColorsManager.white,
        ),
      ),
    ),
  );

  getTodosFromFireStore() async {

    CollectionReference todoCollection =
    FirebaseFirestore.instance.collection(TodoDM.collectionName);
    QuerySnapshot collectionSnapShot = await todoCollection.get();
    List<QueryDocumentSnapshot> documentSnapShot = collectionSnapShot.docs;
      todoslist = documentSnapShot.map((docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        TodoDM todo = TodoDM.fromFireStore(json);
        return todo;
      },
      ).toList();


      todoslist = todoslist.where((todo) =>
      todo.dateTime.day == calenderSelectedDate.day &&
          todo.dateTime.month == calenderSelectedDate.month &&
          todo.dateTime.year == calenderSelectedDate.year).toList();

      setState(() {

      });
  }
}
