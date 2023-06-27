/*
This component will represent how each task will be displayed
it will have;
- title
- date due
- progress bar
- progress percentage
- three dots */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime todaysDate = DateTime.now();
    DateTime dueDate = DateTime.parse("2023-06-30");

    int remainingDays = dueDate.difference(todaysDate).inDays;
    Color dateTextColor = const Color(0xffA7A7A7);

    if (remainingDays > 0 && remainingDays <= 3) {
      dateTextColor = const Color(0xffFFAC48);
    } else if (remainingDays < 0) {
      dateTextColor = Colors.red;
    } else {
      dateTextColor = dateTextColor;
    }

    return SingleChildScrollView(
      child: Container(
        width: 90.w,
        height: 18.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffFFAC48).withOpacity(0.3),
                blurRadius: 2,
                offset: const Offset(3, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 8.0, 0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Task title',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: PopupMenuButton<String>(
                        offset: const Offset(0, 40),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Edit',
                              padding: EdgeInsets.only(left: 18),
                              child: Text(
                                'Edit Task',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Delete',
                              padding: EdgeInsets.only(left: 18),
                              child: Text(
                                'Delete Task',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.0,
                                  color: Colors.red,
                                ),),
                            ),
                          ];
                        },
                      ),
                      /*child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),*/
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    DateFormat('yyyy/MM/dd').format(dueDate),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: dateTextColor,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: const FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: 0.25,
                          child: LinearProgressIndicator(
                            value: 0.5,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Color(0xffFFAC48)),
                            backgroundColor: Color(0xffECECEC),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '25%',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                      color: const Color(0xffFFAC48),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
