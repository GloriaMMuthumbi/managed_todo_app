import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'new_task_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 7.h,
          backgroundColor: Colors.grey[50],
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Wrap(
                children: <Widget>[
                  IconButton(
                      iconSize: 3.5.h,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      )),
                  IconButton(
                      iconSize: 3.5.h,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                child: const Padding(
              padding: EdgeInsets.only(
                bottom: 4.0,
              ),
              child: Text(
                "My Tasks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )),
            Container(
                child: TabBar(
              controller: tabController,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontSize: 15.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: const Color(0xffA7A7A7),
              unselectedLabelStyle: const TextStyle(
                fontSize: 15.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: const Color(0xffFFAC48),
              tabs: const <Tab>[
                Tab(text: "To-do"),
                Tab(text: "Due Soon"),
                Tab(text: "Completed"),
              ],
            )),
            Container(
              width: 100.w,
              height: 77.h,
              child: TabBarView(
                controller: tabController,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const Expanded(
                          child: Center(
                            child: Text(
                              "You currently have no tasks to do",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                color: Color(0xffA7A7A7),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 15.0, bottom: 15.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NewTaskFormScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5.0,
                                backgroundColor: Color(0xffFFAC48),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(2.h),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 85.0),
                      child: Text(
                        "You currently have no tasks due soon",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Color(0xffA7A7A7),
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 85.0),
                      child: Text(
                        "You currently have no completed tasks",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Color(0xffA7A7A7),
                        ),
                      ),
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
