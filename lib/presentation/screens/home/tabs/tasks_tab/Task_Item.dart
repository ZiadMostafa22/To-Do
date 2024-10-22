import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/core/utils/app_styles.dart';
import 'package:todo/core/utils/color_manager.dart';
import 'package:todo/core/utils/date_utils.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: ColorsManeger.white,
          ),
          child: Slidable(
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: (context) {},
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  bottomLeft: Radius.circular(15.r)
              )
                ),
                SlidableAction(
                  flex: 2,
                  onPressed: (context) {},
                  backgroundColor: ColorsManeger.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',

                ),
              ],
            ),
            child: Padding(

              padding: EdgeInsets.all(17.r),
              child: Row(
                children: [
                  Container(
                    width: 5.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorsManeger.blue,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // Add spacing between the line and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task Title',
                          style: AppLightStyles.taskTitle,
                        ),
                        Text(
                          'Task Description',
                          style: AppLightStyles.taskDescription,
                        ),
                        Text(
                          DateTime.now().toFormattedDate,
                          style: AppLightStyles.taskDate,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.blue,
                    ),
                    width: 50.w,
                    height: 30.h,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}


