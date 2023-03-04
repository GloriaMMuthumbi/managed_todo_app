import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewTaskFormScreen extends StatelessWidget {
  const NewTaskFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(8.h),
          child: AppBar(
            toolbarHeight: 7.h,
            backgroundColor: Colors.grey[50],
            elevation: 0,
            iconTheme: const IconThemeData(
                color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25.0),
            child: Column(
              children: [
                Container(
                child: const Padding(
                padding: EdgeInsets.only(bottom: 4.0,),
                child: Text("New Tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                ),
                SizedBox (height: 3.h,),
                const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffF0F0F0),
                      labelText: 'Task Title',
                      labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                      //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
                    ),
                  ),
                ),
                SizedBox (height: 3.h,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffF0F0F0),
                      labelText: 'Task Description',
                      labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                        //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
                      ),
                    ),
                      //maxLines: 5,
                      //minLines: 1
                  ),
                ),
                SizedBox (height: 3.h,),
                const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffF0F0F0),
                    labelText: 'Date Due',
                    labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                      //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
                    ),
                  ),
                ),
              ]
            ),
          )
        )
    );
  }
}
