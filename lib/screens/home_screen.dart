import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 8.h,
          backgroundColor: Colors.grey[50],
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Wrap(
                children: <Widget>[
                  IconButton(
                      iconSize: 4.h,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      )
                  ),
                  IconButton(
                      iconSize: 4.h,
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
      /*body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                    'assets/images/menu.svg',
                    height: 4.5.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                        child: Wrap(
                            children: [
                              SvgPicture.asset(
                                'assets/images/search.svg',
                                height: 4.5.h,
                              ),
                              SvgPicture.asset(
                                'assets/images/bell.svg',
                                height: 4.5.h,
                              )
                            ]
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),*/
    );
  }
}
