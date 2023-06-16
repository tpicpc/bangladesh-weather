import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weatherbd/ui/route/route.dart';
import 'package:weatherbd/ui/services/theme_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weatherbd/ui/views/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(WeatherBangladesh());
}

class WeatherBangladesh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: ThemeServices().theme,
          initialRoute: splash,
          getPages: getPages,
        );
      },
    );
  }
}
