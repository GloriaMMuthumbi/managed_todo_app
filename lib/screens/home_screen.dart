import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 3, vsync: this);

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
                      )
                  ),
                  IconButton(
                      iconSize: 3.5.h,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                      )
                  )
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
                padding: EdgeInsets.only(bottom: 4.0,),
                child: Text("My Tasks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),),
              )
            ),
            Container(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: const Color(0xffA7A7A7),
                indicatorColor: const Color(0xffFFAC48),
                tabs: const [
                  Tab(text: "To-do"),
                  Tab(text: "Due Soon"),
                  Tab(text: "Completed"),
                ],
              )
            ),
            Container(
              width: 10.w,
              height: 10.h,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Text("First Page"),
                  Text("Second Page"),
                  Text("Third Page"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
