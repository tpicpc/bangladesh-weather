import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AllDettails extends StatefulWidget {
  var weatherModel;
  AllDettails(this.weatherModel);

  @override
  State<AllDettails> createState() => _AllDettailsState();
}

class _AllDettailsState extends State<AllDettails> {
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
        elevation: 5,
      ),
      backgroundColor: Color.fromARGB(255, 13, 32, 78),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),

            //============image, temp, clear=================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.network(
                      "https:${widget.weatherModel?.current?.condition.icon}"),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.weatherModel.current.tempC.round().toString(),
                        style: TextStyle(
                            fontSize: 50.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "o",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.weatherModel?.current?.condition.text,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(
              height: 90.h,
            ),

            //============max, min=================

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 145.h,
                    width: 260.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                "সর্বোচ্চ",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 140.w,
                          thickness: 2,
                          height: 1,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        //============max temp=================

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "তাপমাত্রা",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "${widget.weatherModel?.forecast.forecastday[0].day.maxtempC.round().toString()}",
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text("o"),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "c",
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 15.h,
                          color: Colors.white54,
                        ),

                        //============max wind=================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "বাতাস",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "${widget.weatherModel?.forecast.forecastday[0].day.maxwindKph.round().toString()}",
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(""),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      " km/h",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 10.h,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140.h,
                    width: 0.w,
                    color: Colors.white54,
                  ),
                  Container(
                    height: 140.h,
                    width: 110.w,
                    child: Column(
                      children: [
                        Text(
                          "সর্বনিম্ন",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ),
                        Divider(
                          thickness: 2,
                          height: 2,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        //============min temp= ================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "${widget.weatherModel?.forecast.forecastday[0].day.mintempC.round().toString()}",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Text("o"),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "c",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 5.h,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        //============min wind=================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "${widget.weatherModel?.forecast.forecastday[0].day.maxwindMph.round().toString()}",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Text(""),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                " km/h",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 8.h,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //=========বাতাসের গতিপ্রবাহ=================

            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "বাতাসের গতিপ্রবাহ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
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
                        "${widget.weatherModel?.current?.feelslikeC.round().toString()} km/h",
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
              color: Colors.white54,
            ),

            //========আচমকা এলোমেলো বাতাসের গতিপ্রবাহ====================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "দমকা বাতাসের গতিপ্রবাহ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.weatherModel?.current?.gustKph.round().toString()} km/h",
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
              color: Colors.white54,
            ),

            //========অনুভূতিশীল তাপমাত্রা ===================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "অনুভূতিশীল তাপমাত্রা ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "${widget.weatherModel?.current?.feelslikeC.round().toString()}",
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text("o"),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "c",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 2,
              color: Colors.white54,
            ),

            //========বৃষ্টি হওয়ার সম্ভাবনা ====================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "বৃষ্টি হওয়ার সম্ভাবনা ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.weatherModel?.forecast?.forecastday[0].day.dailyChanceOfRain.round().toString()}%",
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
              color: Colors.white54,
            ),

            //========বৃষ্টিপাতের পরিমাণ  ====================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "বৃষ্টিপাতের পরিমাণ ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.weatherModel?.current.precipMm.round().toString()} mm",
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
              color: Colors.white54,
            ),

            //==========কুয়াশা হওয়ার সম্ভাবনা  ====================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "কুয়াশা হওয়ার সম্ভাবনা ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.weatherModel?.forecast?.forecastday[0].day.dailyChanceOfSnow} %",
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
              color: Colors.white54,
            ),

            //==========মেঘের আচ্ছাধন   ====================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "মেঘের আচ্ছাধন ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.weatherModel?.current.cloud.round().toString()} %",
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
              color: Colors.white54,
            ),

            //==========আদ্রতা   ====================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "আদ্রতা ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.weatherModel?.current.humidity.round().toString()} %",
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
              color: Colors.white54,
            ),
            //==========বায়ুচাপ====================

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "বায়ুচাপ",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.weatherModel?.current?.pressureMb.round().toString()} mb",
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
              color: Colors.white54,
            ),

            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
