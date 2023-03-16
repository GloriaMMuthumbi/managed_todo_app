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

  List<TextEditingController> subtaskController = [];

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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                    fontFamily: 'Inter', fontSize: 14,
                    fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                    //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
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
                    fontFamily: 'Inter', fontSize: 14,
                    fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
                    //labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xffB9B9B9),
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
                    fontFamily: 'Inter', fontSize: 14,
                    fontWeight: FontWeight.w600, color: Color(0xffB9B9B9),
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
                          )),
                          child: child!,
                        );
                      });
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
                          Text('Subtasks:',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Subtask 1',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              //decoration: isSelected ? TextDecoration.lineThrough : null,
                            )),
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            isSelected = value;
                          });
                        },
                        activeColor: const Color(0xffFFAC48),
                        checkColor: Colors.white,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Column(children: [
                            Column(
                              children: [
                                ...subtaskController.asMap().entries.map((entry) {
                                  final int index = entry.key;
                                  final TextEditingController controller = entry.value;

                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            decoration: const InputDecoration(
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
                                            controller: controller,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete, color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            // Remove the controller at the given index
                                            subtaskController.removeAt(index);
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                }).toList(),
                                TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      subtaskController.add(TextEditingController());
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
                                  ),
                                ),
                              ],
                            )

                          ])),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffFFAC48),
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Save".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

/*IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isActive = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Color(0xffea0000),
                                            size: 22,
                                          ),
                                      ),*/
