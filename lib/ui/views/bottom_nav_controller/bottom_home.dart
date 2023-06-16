import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weatherbd/models/weather_model.dart';
import 'package:weatherbd/ui/route/route.dart';
import 'package:weatherbd/ui/services/api_services.dart';
import 'package:weatherbd/ui/widget/todays_weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomHome extends StatefulWidget {
  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  ApiServices apiServices = ApiServices();
  late StreamSubscription subscription;
  bool hasInternet = false;

  late StreamSubscription internetSubscription;

  //=========internet connection chacker start=====================

  @override
  void dispose() {
    subscription.cancel();
  }

//=========internet connection chacker start=====================

  //======All District list for dropdown menu bar========

  List<String> allDistirct = [
    "Bandarban",
    "Brahmanbaria",
    "Baorguna Barisal",
    "Barisal",
    "Bhola",
    "Bagerhat",
    "Bogra BD",
    "Chandpur",
    "Chittagong",
    "Comilla BD",
    "Cox's Bazar",
    "Chuadanga Khulna",
    "Chapai Nawabganj",
    "Dhaka",
    "Dinajpur",
    "Feni",
    "Faridpur",
    "Gazipur",
    "Gopalganj",
    "Gaibandha Rangpur",
    "Habiganj",
    "Jhalokati Barisal",
    "Jhenaidah Khulna",
    "Jamalpur",
    "Jessore",
    "Joypurhat Rajshahi",
    "Khagrachhari",
    "Kishoreganj",
    "Khulna",
    "Kushtia",
    "Kurigram Rangpur",
    "Lalmonirhat",
    "Lakshmipur",
    "Madaripur",
    "Manikganj",
    "Munshiganj",
    "Magura",
    "Meherpur Khulna",
    "Mymensingh",
    "Moulvibazar Sylhet",
    "Netrokona Mymensingh",
    "Narail",
    "Naogaon",
    "Natore Rajshahi",
    "Noakhali",
    "Nilphamari Rangpur",
    "Narayanganj",
    "Narsingdi",
    "Patuakhali",
    "Pirojpur",
    "Panchagarh",
    "Pabna",
    "Rangamati",
    "Rajbari",
    "Rajshahi",
    "Rangpur",
    "Shariatpur Dhaka",
    "Satkhira",
    "Sherpur",
    "Sunamganj",
    "Sylhet",
    "Sirajganj",
    "Tangail",
    "Thakurgaon",
  ];

  String? district = "Dhaka";
  Future<void> _saveSelectedValue(String values) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
    await prefs.setString('selectedValue', values);
  }

  @override
  void initState() {
    super.initState();

    _loadSelectedValue();

    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
    });
  }

  Future<void> _loadSelectedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedValue = prefs.getString('selectedValue');
    if (selectedValue != null) {
      setState(() {
        district = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===========Appbar start code ===================
      appBar: AppBar(
        title: DropdownButton(
            dropdownColor: Color.fromARGB(255, 1, 1, 75),
            alignment: Alignment.topRight,
            iconSize: 45.sp,
            underline: Container(),
            iconEnabledColor: Colors.white,
            elevation: 3,
            menuMaxHeight: 600.h,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            value: district,
            items: allDistirct.map((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (newValue) async {
              setState(() {
                district = newValue;
                _saveSelectedValue(district.toString());
              });
              // await data.add(district);
            }),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(news);
              },
              icon: Icon(Icons.newspaper)),
        ],
      ),

      //===========Appbar end code ===================

      //Drawer Navigation Start

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Stack(
                  children: [
                    WeatherBg(
                        weatherType: WeatherType.sunnyNight,
                        width: 370.w,
                        height: 190.h),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.white24,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              " প্রযুক্তি আমাদের শিক্ষার ডানা হতে পারে যা বিশ্বকে আরো দ্রুত এগিয়ে নিয়ে যেতে পারবে...",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )

                    // Container(
                    //   color: Get.isDarkMode == false
                    //       ? Colors.amber
                    //       : Colors.black12,
                    //   child: Column(
                    //     children: [
                    //       Text(
                    //         "Welcome to this App",
                    //         style: TextStyle(
                    //           fontSize: 25.sp,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                )),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text("প্রশ্ন ও উত্তর"),
              onTap: () => Get.toNamed(faq),
            ),
            ListTile(
              leading: Icon(Icons.rate_review_outlined),
              title: Text("রিভিউ দিন"),
              onTap: () => LaunchReview.launch(
                androidAppId: "com.chironjit_roy.bangladesh_weather",
              ),
            ),
            ListTile(
              leading: Icon(Icons.share_rounded),
              title: Text("শেয়ার"),
              onTap: () => Share.share("com.chironjit_roy.bangladesh_weather"),
            ),
            ListTile(
              leading: Icon(Icons.help_outlined),
              title: Text("কিভাবে ব্যাবহার করব"),
              onTap: () => Get.toNamed(howToUse),
            ),
            ListTile(
              leading: Icon(Icons.apps_outage_outlined),
              title: Text("অ্যাপ সম্পর্কে"),
              onTap: () => Get.toNamed(aboutApp),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app_outlined),
              title: Text("বেরিয়ে  যান "),
              onTap: () => SystemNavigator.pop(),
            ),
          ],
        ),
      ),

      //Drawer Navigation End

      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TodaysWeather(
                      weatherModel: weatherModel,
                    ),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                    hasInternet ? "Not data found" : "ইন্টারনেট সংযোগ নেই"),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
          future: apiServices.getWeatherData(district.toString())),
    );
  }
}
