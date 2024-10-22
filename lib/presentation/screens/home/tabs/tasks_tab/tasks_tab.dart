import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/color_manager.dart';
import 'package:todo/presentation/screens/home/tabs/tasks_tab/Task_Item.dart';
import 'package:todo/core/utils/app_styles.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

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
              SizedBox(
                height: 30.h,
              ),
              TaskItem(),
            ],
          );
        });
  }

  Widget buildCalenderTimeLine() =>
      EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          // `selectedDate` is the new date selected.
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
              color: ColorsManeger.blue,
            ),
            dayStrStyle: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManeger.blue,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: ColorsManeger.white,
            ),
          ),
          inactiveDayStyle: DayStyle(
            dayNumStyle: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManeger.black,
            ),
            dayStrStyle: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManeger.black,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: ColorsManeger.white,
            ),
          ),
        ),
      );
}
