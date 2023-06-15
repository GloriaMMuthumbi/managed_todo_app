/*
This component will represent how each task will be displayed
it will have;
- title
- date due
- progress bar
- progress percentage
- three dots */

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class taskComponent extends StatelessWidget {
  const taskComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 14.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffFFAC48).withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(3, 3),
          )
        ]
      ),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(12.0, 15.0, 8.0, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Task title',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                      Text('01/01/24',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Color(0xffA7A7A7),
                        ),
                      ),
                    ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
