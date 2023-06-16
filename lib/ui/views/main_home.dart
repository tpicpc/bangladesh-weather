import 'dart:async';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weatherbd/ui/views/bottom_nav_controller/bottom_home.dart';
import 'bottom_nav_controller/news.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'drawer_pages/faq.dart';

class MainHome extends StatefulWidget {
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  RxInt _currentIndex = 0.obs;

  // BottomNavigation Pages start

  final _pages = [
    BottomHome(),
    NewsScreen(),
    FaqScreen(),
  ];

  // BottomNavigation Pages End

  //For Exit Dialouge start
  Future _exitDialoge(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("আপনি কি অ্যাপ থেকে বের হতে চান ?"),
            content: Row(
              children: [
                TextButton(onPressed: () => Get.back(), child: Text("না")),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text("হ্যাঁ")),
              ],
            ),
          );
        });

//For Exit Dialouge End
  }

  @override
  void initState() {
    //==============forground notifications==============
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title.toString());
      }
    });

    //==============background notifications==============
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null) {
        Navigator.pushNamed(context, message.data['path']);
      }
    });
    //==============terminent notifications==============

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        Navigator.pushNamed(context, message.data['path']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialoge(context);
        return Future.value(false);
      },
      child: Obx(
        () => SafeArea(
          child: Scaffold(
            //For BottomNavitaion Bar Start
            // bottomNavigationBar: CurvedNavigationBar(
            //   index: _currentIndex.value,
            //   onTap: (Value) => _currentIndex.value = Value,
            //   backgroundColor: Colors.transparent,
            //   color: Colors.white,
            //   height: 65.h,
            //   animationDuration: Duration(milliseconds: 330),
            //   items: [
            //     Icon(
            //       Icons.home_outlined,
            //       size: 40,
            //     ),
            //     Icon(
            //       Icons.newspaper_outlined,
            //       size: 40,
            //     ),
            //   ],
            // ),

            bottomNavigationBar: BottomNavyBar(
              containerHeight: 70.h,
              backgroundColor:
                  Get.isDarkMode == false ? Color(0xFF000a3f) : Colors.black12,
              selectedIndex: _currentIndex.value,
              iconSize: 37.sp,
              onItemSelected: (Value) => _currentIndex.value = Value,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              showElevation: true,
              itemCornerRadius: 24.r,
              curve: Curves.easeIn,
              items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.home_outlined), title: Text("হোম")),
                BottomNavyBarItem(
                    icon: Icon(Icons.newspaper_outlined), title: Text("নিউজ ")),
                BottomNavyBarItem(
                    icon: Icon(Icons.question_answer_outlined),
                    title: Text("FAQ")),
              ],
            ),

            //For BottomNavitaion Bar End

            //=============================================================================================================

            body: _pages[_currentIndex.value],
          ),
        ),
      ),
    );
  }
}
