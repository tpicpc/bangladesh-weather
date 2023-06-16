import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

class YesdayWeather extends StatefulWidget {
  var weatherModel;
  YesdayWeather(this.weatherModel);

  @override
  State<YesdayWeather> createState() => _YesdayWeatherState();
}

class _YesdayWeatherState extends State<YesdayWeather> {
  final intarsitailAds = AdManagerInterstitialAd.load(
      adUnitId: "ca-app-pub-4658221067173714/2171989653",
      request: const AdManagerAdRequest(),
      adLoadCallback: AdManagerInterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.show();
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('AdManagerInterstitialAd failed to load: $error');
        },
      ));

  @override
  void initState() {
    // TODO: implement initState
    intarsitailAds;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("আগামীকালের আবহাওয়া"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 650.h,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Color.fromARGB(255, 13, 32, 78),
                ),
                child: Column(
                  children: [
                    //===========Date, Days Name Container===========
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(width: 2, color: Colors.white70),
                          color: Get.isDarkMode == false
                              ? Color.fromARGB(255, 1, 28, 90)
                              : Colors.white24,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat.yMMMMEEEEd().format(DateTime.parse(widget
                                .weatherModel.forecast?.forecastday[1].date)),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    //===========temp, max temp, min temp,  Container===========
                    SizedBox(
                      height: 20.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 175.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "সর্বোচ্চ তাপমাত্রা",
                                    style: TextStyle(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          widget
                                                  .weatherModel
                                                  ?.forecast
                                                  ?.forecastday?[1]
                                                  .day
                                                  ?.maxtempC
                                                  ?.round()
                                                  .toString() ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "o",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 75.h,
                              width: 175.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "সর্বনিম্ন তাপমাত্রা ",
                                    style: TextStyle(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          widget
                                                  .weatherModel
                                                  ?.forecast
                                                  ?.forecastday?[1]
                                                  .day
                                                  ?.mintempC
                                                  ?.round()
                                                  .toString() ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "o",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 175.h,
                          width: 80.w,
                          child: Column(
                            children: [
                              Image.network(
                                  "https:${widget.weatherModel?.forecast?.forecastday?[1].day?.condition?.icon ?? ""}"),
                              Text(
                                widget.weatherModel?.forecast?.forecastday?[1]
                                        .day?.condition?.text ??
                                    "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.white12),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "সূর্যোদয়",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(widget
                                              .weatherModel
                                              ?.forecast
                                              ?.forecastday?[1]
                                              .astro
                                              ?.sunrise ??
                                          ""),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.white12),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "সূর্যাস্ত",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(widget.weatherModel?.forecast
                                              ?.forecastday?[1].astro?.sunset ??
                                          ""),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //===========Others Dettails for example: himudity, wind, feel likes===========
                    //========অনুভূতিশীল তাপমাত্রা====================

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "অনুভূতিশীল তাপমাত্রা ( 1 PM)",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  widget.weatherModel?.forecast?.forecastday?[1]
                                          .hour?[14].feelslikeC
                                          ?.round()
                                          .toString() ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "o",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "c",
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                      color: Colors.white30,
                    ),

                    //========Wind====================

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "সর্বোচ্চ বাতাসের গতি",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            "${widget.weatherModel?.forecast?.forecastday?[1].day?.maxwindKph} km/h",
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                      color: Colors.white30,
                    ),

                    //========বৃষ্টিপাতের পরিমাণ====================

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "বৃষ্টি হওয়ার সম্ভাবনা",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.weatherModel?.forecast?.forecastday?[1]
                                        .day?.dailyChanceOfRain
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                " %",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                      color: Colors.white30,
                    ),

                    //========দূরত্বের দৃশ্যমানতা====================

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "দূরত্বের দৃশ্যমানতা",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            "${widget.weatherModel?.forecast.forecastday[1].day.avgvisKm.toString() ?? ""} km",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),

                    Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                      color: Colors.white30,
                    ),

                    //========আদ্রতা ====================

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "আদ্রতা",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            "${widget.weatherModel?.forecast.forecastday[1].day.avghumidity.toString() ?? ""} %",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),

                    Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                      color: Colors.white30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color.fromARGB(255, 1, 28, 90)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "প্রতি ঘণ্টার আবহাওয়া",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 170.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        widget.weatherModel.forecast.forecastday[1].hour.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 1, top: 10, bottom: 20),
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white24,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      widget.weatherModel.forecast
                                          .forecastday[1].hour[index].tempC
                                          .round()
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "O",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.sp),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      "c",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.teal),
                                child: Image.network(
                                    "https:${widget.weatherModel.forecast.forecastday[1].hour[index].condition.icon}"),
                              ),
                              Text(
                                DateFormat.j().format(DateTime.parse(widget
                                    .weatherModel
                                    .forecast
                                    .forecastday[1]
                                    .hour[index]
                                    .time)),
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
