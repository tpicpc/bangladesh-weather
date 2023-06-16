import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

class HourByWeathers extends StatefulWidget {
  var weatherModel;
  HourByWeathers(this.weatherModel);

  @override
  State<HourByWeathers> createState() => _HourByWeathersState();
}

class _HourByWeathersState extends State<HourByWeathers> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("প্রতি ঘণ্টার আবহাওয়া"),
      ),
      body: Column(children: [
        SizedBox(
          height: 833.h,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:
                  widget.weatherModel?.forecast?.forecastday[0].hour.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 32, 78),
                        borderRadius: BorderRadius.circular(30.r)),
                    height: 170.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //====================timae, Image ======================
                        Container(
                          width: 100.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "সময়",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    DateFormat.j().format(DateTime.parse(widget
                                        .weatherModel
                                        .forecast
                                        .forecastday[0]
                                        .hour[index]
                                        .time)),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.teal),
                                child: Image.network(
                                    "https:${widget.weatherModel.forecast.forecastday[0].hour[index].condition.icon}"),
                              ),
                            ],
                          ),
                        ),

                        //====================temp ======================

                        Container(
                          width: 100.w,
                          height: 150.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    " তাপমাত্রা ",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          widget.weatherModel.forecast
                                              .forecastday[0].hour[index].tempC
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
                                            color: Colors.white,
                                            fontSize: 15.sp),
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
                                ],
                              ),
                              Text(
                                widget.weatherModel?.forecast?.forecastday?[0]
                                        .day?.condition?.text ??
                                    "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18.sp),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 200.w,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.white12),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 15),
                                    child: Column(
                                      children: [
                                        Text(
                                          "বৃষ্টি হওয়ার সম্ভাবনা ",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.white12),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Column(
                                      children: [
                                        Text(
                                          "অনুভূতিশীল তাপমাত্রা",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Text(
                                                widget
                                                        .weatherModel
                                                        ?.forecast
                                                        ?.forecastday?[0]
                                                        .hour?[index]
                                                        .feelslikeC
                                                        ?.round()
                                                        .toString() ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
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
                                              padding: const EdgeInsets.only(
                                                  top: 15),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
