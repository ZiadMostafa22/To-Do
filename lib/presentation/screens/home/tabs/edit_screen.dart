import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/app_styles.dart';
import 'package:todo/core/utils/color_manager.dart';
import 'package:todo/core/utils/date_utils.dart';
import 'package:todo/databsae_manager/model/todo_dm.dart';

import '../../../../databsae_manager/functions.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as TodoDM;
    var formatDate = data.dateTime.toFormattedDate;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Edit Task',
          style: AppLightStyles.appBarTextStyle?.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, bottom: 150.h, right: 20.w, left: 20.w),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Edit Task',
                style: AppLightStyles.bottomSheetTitle?.copyWith(fontSize: 22.sp),
              ),
              Form(
                child: Column(
                  children: [
                    // First TextFormField for Task Title
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: TextFormField(
                        initialValue: data.title,
                        onChanged: (value) {
                          data.title = value;
                        },
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please Enter Task Title';
                          }
                          if (input.length < 6) {
                            return 'Sorry, Title must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Task Title',
                          hintStyle: AppLightStyles.hintStyle?.copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ),

                    // Second TextFormField for Task Description
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: TextFormField(
                        initialValue: data.description,
                        onChanged: (value) {
                          data.description = value;
                        },
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please Enter Task Description';
                          }
                          if (input.length < 10) {
                            return 'Description must be at least 10 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Task Description',
                          hintStyle: AppLightStyles.hintStyle?.copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Select Date',
                      style: AppLightStyles.bottomSheetTitle?.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () async {
                  var chooseDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now());

                  if (chooseDate != null) {
                    setState(() {
                      data.dateTime = chooseDate;
                    });
                  }
                },
                child: Text(
                  formatDate,
                  style: AppLightStyles.bottomSheetTitle?.copyWith(fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 45.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseFunction.updateTask(data);
                      },
                      child: Text(
                        'Save Changes',
                        style: AppLightStyles.bottomSheetTitle?.copyWith(fontSize: 18.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
