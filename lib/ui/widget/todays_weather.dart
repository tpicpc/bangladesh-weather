import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weatherbd/models/weather_model.dart';
import '../views/all_weather_dettails.dart';
import '../views/hour_by_weather.dart';
import '../views/sev_days_weather.dart';
import '../views/yesterday.dart';

class TodaysWeather extends StatefulWidget {
  final WeatherModel? weatherModel;
  TodaysWeather({
    super.key,
    this.weatherModel,
  });

  @override
  State<TodaysWeather> createState() => _TodaysWeatherState();
}

class _TodaysWeatherState extends State<TodaysWeather> {
  final BannerAd bannerAd = BannerAd(
    size: AdSize(width: 300, height: 50),
    request: AdRequest(),
    adUnitId: "ca-app-pub-4658221067173714/4293905903",
    listener: BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (ad) {},
      // Called when an ad request failed.
      onAdFailedToLoad: (ad, err) {
        ad.dispose();
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) {},
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) {},
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) {},
    ),
  );

  @override
  void initState() {
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: WeatherType.sunnyNight,
            width: MediaQuery.of(context).size.width,
            height: 763.5.h),
        Column(
          children: [
            SizedBox(
              height: 700.h,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    //======location and time================

                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                      decoration: BoxDecoration(

                          //color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white12),
                      child: Column(
                        children: [
                          Text(
                            widget.weatherModel?.location?.name ?? "",
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd().format(DateTime.parse(widget
                                    .weatherModel?.current?.lastUpdated
                                    .toString() ??
                                "")),
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white10),
                          child: Image.network(
                            "https:${widget.weatherModel?.current?.condition?.icon ?? ""}",
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    widget.weatherModel?.current?.tempC
                                            ?.round()
                                            .toString() ??
                                        "",
                                    style: TextStyle(
                                        fontSize: 80.sp,
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "o",
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                                Text(
                                  "c",
                                  style: TextStyle(
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                              ],
                            ),
                            Container(
                              width: 150.w,
                              height: 60.h,
                              child: Text(
                                widget.weatherModel?.current?.condition?.text ??
                                    "",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    //===========Last update time container Container==========

                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                        height: 100.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Text(
                                "সর্বশেষ আপডেট হয়েছে",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                DateFormat.jm().format(DateTime.parse(
                                    widget.weatherModel?.current?.lastUpdated ??
                                        "")),
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )),

                    //==============dettails temp, wind, feel Likes, etc.............===

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 9),
                                                child: Text(
                                                  widget
                                                          .weatherModel
                                                          ?.forecast
                                                          ?.forecastday?[0]
                                                          .day
                                                          ?.maxtempC
                                                          ?.round()
                                                          .toString() ??
                                                      "",
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "o",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 9),
                                                child: Text(
                                                  "C",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "সর্বোচ্চ তাপমাত্রা",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 9),
                                                child: Text(
                                                  widget
                                                          .weatherModel
                                                          ?.forecast
                                                          ?.forecastday?[0]
                                                          .day
                                                          ?.mintempC
                                                          ?.round()
                                                          .toString() ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Text(
                                                "o",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 9),
                                                child: Text(
                                                  "C",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "সর্বনিম্ন তাপমাত্রা",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 20.h,
                            ),

                            //========অনুভূতিশীল তাপমাত্রা====================

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "অনুভূতিশীল তাপমাত্রা",
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
                                          widget.weatherModel?.current
                                                  ?.feelslikeC
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "বাতাসের গতিপ্রবাহ",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "(${widget.weatherModel?.current?.windDir}) ",
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "${widget.weatherModel?.current?.windKph} km/h",
                                        style: TextStyle(
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.bold,
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

                            //========আচমকা এলোমেলো বাতাসের গতিপ্রবাহ====================

                            SizedBox(
                              height: 20.h,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "দমকা বাতাসের গতিপ্রবাহ",
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "${widget.weatherModel?.current?.gustKph} km/h",
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

                            // Text(weatherModel?.forecast?.forecastday[0].hour.length),

                            //========বৃষ্টিপাতের পরিমাণ====================

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        widget
                                                .weatherModel
                                                ?.forecast
                                                ?.forecastday?[0]
                                                .day
                                                ?.dailyChanceOfRain
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  //Text(weatherModel?.forecast.forecastday[1].day.maxwindMph),
                                  Text(
                                    "${widget.weatherModel?.current?.visKm?.round().toString() ?? ""}km",
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
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //============বিস্তারিত দেখুন button=================

                    //Text(weatherModel?.current?.pressureMb),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) =>
                                //  NewsDettails(newsModel?.articles[index])
                                AllDettails(widget.weatherModel),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(20.r)),
                          height: 55.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "বিস্তারিত দেখুন",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                                size: 40.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    //====================Sun Moon Category Start====================================
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //===========Sun Container=========
                          Container(
                              height: 140.h,
                              width: 195.w,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Column(
                                children: [
                                  Container(
                                    height: 75.h,
                                    width: 75.w,
                                    child: Image.network(
                                        "https://cdn.weatherapi.com/weather/64x64/day/113.png"),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          "সূর্যোদয় :  ",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        widget
                                                .weatherModel
                                                ?.forecast
                                                ?.forecastday?[0]
                                                .astro
                                                ?.sunrise ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          "সূর্যাস্ত :  ",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        widget
                                                .weatherModel
                                                ?.forecast
                                                ?.forecastday?[0]
                                                .astro
                                                ?.sunset ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )),

                          //=========Moon Container===========
                          Container(
                              height: 140.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.teal),
                                    child: Image.network(
                                        "https://cdn.weatherapi.com/weather/64x64/night/113.png"),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "চন্দ্রোদয়: ",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        widget
                                                .weatherModel
                                                ?.forecast
                                                ?.forecastday?[0]
                                                .astro
                                                ?.moonrise ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          "চন্দ্রাস্ত :  ",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        widget
                                                .weatherModel
                                                ?.forecast
                                                ?.forecastday?[0]
                                                .astro
                                                ?.moonset ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),

                    //=====Sleckbar slider===================

                    // Divider(
                    //   indent: 20,
                    //   endIndent: 20,
                    //   thickness: 2,
                    //   color: Colors.grey,
                    // ),

                    // SizedBox(
                    //   height: 20.h,
                    // ),

                    // Container(
                    //   alignment: Alignment.center,
                    //   height: 300.h,
                    //   width: 400.w,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30.r),
                    //     color: Colors.black12,
                    //   ),
                    //   child: SizedBox(
                    //     height: 200.h,
                    //     child: Column(
                    //       children: [
                    //         Center(
                    //           child: SleekCircularSlider(
                    //             min: 0,
                    //             max: 100,
                    //             appearance: CircularSliderAppearance(
                    //                 customWidths: CustomSliderWidths(
                    //                   trackWidth: 12.w,
                    //                 ),
                    //                 infoProperties: InfoProperties(
                    //                     bottomLabelText: "আদ্রতা",
                    //                     bottomLabelStyle: TextStyle(
                    //                         fontSize: 25.sp,
                    //                         color: Colors.tealAccent,
                    //                         height: 2.h,
                    //                         fontWeight: FontWeight.bold)),
                    //                 customColors: CustomSliderColors(
                    //                     hideShadow: true,
                    //                     trackColor: Colors.lightBlueAccent,
                    //                     progressBarColors: [
                    //                       Colors.blue,
                    //                       Colors.lightBlue
                    //                     ]),
                    //                 animationEnabled: true,
                    //                 size: 200.sp),
                    //             initialValue:
                    //                 weatherModel!.current!.humidity!.toDouble(),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // Divider(
                    //   indent: 20,
                    //   endIndent: 20,
                    //   thickness: 2,
                    //   color: Colors.grey,
                    // ),

                    //================== All weather Button==========================

                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white12),
                          height: 55.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (_) =>
                                              //  NewsDettails(newsModel?.articles[index])
                                              HourByWeathers(
                                                  widget.weatherModel),
                                        ),
                                      ),
                                  child: Text(
                                    "প্রতি ঘণ্টার আবহাওয়া",
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                                size: 35.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white12),
                          height: 55.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (_) =>
                                              //  NewsDettails(newsModel?.articles[index])
                                              YesdayWeather(
                                                  widget.weatherModel),
                                        ),
                                      ),
                                  child: Text("আগামীকালের আবহাওয়া",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400))),
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                                size: 35.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white12),
                          height: 55.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (_) =>
                                              //  NewsDettails(newsModel?.articles[index])
                                              ThreeDaysWeather(
                                                  widget.weatherModel),
                                        ),
                                      ),
                                  child: Text("আগামী তিনদিনের আবহাওয়া",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400))),
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                                size: 35.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Container(
                height: 50,
                width: double.infinity,
                child: AdWidget(ad: bannerAd),
              ),
            ),
          ],
        )
      ],
    );
  }
}
