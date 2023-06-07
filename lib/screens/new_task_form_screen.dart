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

  List<TextEditingController> subtaskController = [];
  List<bool> checkboxValues = [false, true, false];

  bool? isActive = false;
  bool? isSelected = false;

  @override
  void initState() {
    super.initState();
    subtaskController.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in subtaskController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 4.0,
                ),
                child: Text(
                  "New Tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffF0F0F0),
                  labelText: 'Task Title',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffB9B9B9),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffF0F0F0),
                  labelText: 'Task Description',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffB9B9B9),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffF0F0F0),
                  labelText: 'Select Date Due',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffB9B9B9),
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
              SizedBox(
                height: 3.h,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Subtasks:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                subtaskController[0].text,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              value: checkboxValues[0],
                              onChanged: (value) {
                                setState(() {
                                  checkboxValues[0] = value!;
                                });
                              },
                              activeColor: const Color(0xffFFAC48),
                              checkColor: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.clear, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                checkboxValues.removeAt(0);
                                subtaskController.removeAt(0);
                              });
                            },
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                ...subtaskController
                                    .asMap()
                                    .entries
                                    .map(
                                      (entry) => Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  filled: true,
                                                  fillColor: Color(0xffF0F0F0),
                                                  labelText: 'Enter Subtask',
                                                  labelStyle: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xffB9B9B9),
                                                  ),
                                                ),
                                                controller: entry.value,
                                                onSubmitted: (_) {
                                                  setState(() {
                                                    subtaskController
                                                        .add(TextEditingController());
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                color: Colors.red),
                                            onPressed: () {
                                              setState(() {
                                                subtaskController.removeAt(
                                                    entry.key);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                                TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      subtaskController
                                          .add(TextEditingController());
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
                                      color: Color(0xffFFAC48),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
          home: NewTaskFormScreen(),
        );
      },
    );
  }
}
