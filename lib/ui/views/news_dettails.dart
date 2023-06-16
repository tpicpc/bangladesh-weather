import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class NewsDettails extends StatefulWidget {
  var data;

  NewsDettails(this.data);

  @override
  State<NewsDettails> createState() => _NewsDettailsState();
}

class _NewsDettailsState extends State<NewsDettails> {
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

  //==========ads start==================

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

//==========ads end==================

  @override
  void initState() {
    intarsitailAds;
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("খবর"),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Column(
                    children: [
                      Text(
                        widget.data?.title,
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.watch_rounded,
                                size: 18.sp,
                              ),
                              Text(
                                "প্রকাশিত: ${widget.data?.date}",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Image.network(
                          widget.data?.image,
                          height: 200.h,
                          width: double.maxFinite,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        widget.data?.description,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 2),
              child: Container(
                height: 50.h,
                width: double.infinity,
                child: AdWidget(ad: bannerAd),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
