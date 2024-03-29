import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class NewTaskFormScreen extends StatefulWidget {
  const NewTaskFormScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskFormScreen> createState() => _NewTaskFormScreenState();
}

class _NewTaskFormScreenState extends State<NewTaskFormScreen> {
  final TextEditingController dateInputController = TextEditingController();
  final TextEditingController subtaskInputController = TextEditingController();

  List<String> subtaskList = [];
  List<bool> checkboxValues = [];
  bool showSubtaskList = false;

  @override
  void dispose() {
    dateInputController.dispose();
    subtaskInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "New Tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Task Title',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA7A7A7),
                    )),
              ),
              SizedBox(height: 3.h),
              TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Task Description',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA7A7A7),
                    )),
              ),
              SizedBox(height: 3.h),
              TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Select Date Due',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA7A7A7),
                    )),
                controller: dateInputController,
                readOnly: true,
                onTap: () async {
                  final pickedDate = await showDatePicker(
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
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    dateInputController.text =
                        DateFormat.yMMMMEEEEd().format(pickedDate).toString();
                  }
                },
              ),
              SizedBox(height: 3.h),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subtasks:',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: subtaskList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CheckboxListTile(
                                      value: checkboxValues[index],
                                      onChanged: (value) {
                                        setState(() {
                                          checkboxValues[index] = value!;
                                        });
                                      },
                                      title: Text(
                                        subtaskList[index],
                                        style: checkboxValues[index]
                                            ? const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Color(0xffA7A7A7),
                                              )
                                            : TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                      ),
                                      activeColor: const Color(0xffFFAC48),
                                      checkColor: Colors.white,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                    )),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    subtaskList.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          );
                        }),
                    if (showSubtaskList)
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          filled: true,
                          fillColor: const Color(0xffF0F0F0),
                          labelText: 'Enter Subtask',
                          labelStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffB9B9B9),
                          ),
                        ),
                        controller: subtaskInputController,
                        onSubmitted: (value) {
                          setState(() {
                            subtaskList.add(value);
                            checkboxValues.add(false);
                            subtaskInputController.clear();
                            showSubtaskList = !showSubtaskList;
                          });
                        },
                      ),
                    TextButton.icon(
                        onPressed: () {
                          setState(() {
                            showSubtaskList = !showSubtaskList;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xffFFAC48),
                        ),
                        label: const Text(
                          "Add Subtask",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffA7A7A7),
                          ),
                        ))
                  ]),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFAC48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ), child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          ),
                      ),
                      ),
                  ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const NewTaskFormScreen(),
        );
      },
    );
  }
}
