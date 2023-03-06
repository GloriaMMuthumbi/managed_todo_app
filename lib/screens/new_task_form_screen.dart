import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class NewTaskFormScreen extends StatefulWidget {
  const NewTaskFormScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskFormScreen> createState() => _NewTaskFormScreenState();
}

class _NewTaskFormScreenState extends State<NewTaskFormScreen> {

  TextEditingController dateInputController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                padding: EdgeInsets.only(bottom: 4.0,),
                child: Text("New Tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                SizedBox (height: 3.h,),
                const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffF0F0F0),
                      labelText: 'Task Title',
                      labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                      //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
                    ),
                  ),
                ),
                SizedBox (height: 3.h,),
                const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffF0F0F0),
                    labelText: 'Task Description',
                    labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                      //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
                    ),
                  ),
                    //maxLines: 5,
                    //minLines: 1
                ),
                SizedBox (height: 3.h,),
                TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffF0F0F0),
                    labelText: 'Date Due',
                    labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                      //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
                    ),
                  ),
                  controller: dateInputController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Color(0xffFFAC48),
                                  onPrimary: Colors.white,
                                  onSurface: Color(0xff000000),
                                )
                            ),
                            child: child!,
                          );
                        });
                    if(pickedDate != null){
                      dateInputController.text = DateFormat.yMMMMEEEEd().format(pickedDate).toString();
                    }
                  },
                ),
                SizedBox (height: 3.h,),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Subtasks',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffB9B9B9),
                      )
                  ),
                ),
                SizedBox (height: 2.h,),
                Align(
                  alignment: Alignment.topLeft,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xffFFAC48),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                          side: const BorderSide(
                          color: Color(0xffFFAC48),
                          width: 2,
                        )
                      ),
                    label: const Text('Add a subtask',
                    style: TextStyle(
                        color:Color(0xffA7A7A7)
                    ),
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton (
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffFFAC48),
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ), child:  Text("Save".toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w800, fontSize: 14,),
                  ),
                  ),
                )
              ]
            ),
          )
        )
    );
  }
}
