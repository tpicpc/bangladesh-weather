import 'package:get/get.dart';
import 'package:weatherbd/ui/views/bottom_nav_controller/bottom_home.dart';
import 'package:weatherbd/ui/views/bottom_nav_controller/news.dart';
import 'package:weatherbd/ui/views/drawer_pages/about_app.dart';
import 'package:weatherbd/ui/views/drawer_pages/all_division.dart';
import 'package:weatherbd/ui/views/drawer_pages/faq.dart';
import 'package:weatherbd/ui/views/drawer_pages/how_to_use.dart';
import 'package:weatherbd/ui/views/hour_by_weather.dart';
import 'package:weatherbd/ui/views/main_home.dart';
import 'package:weatherbd/ui/views/splash_screen.dart';

const String splash = "/splash-screen";
const String mainHome = "/main-some-screen";
const String allDivision = "/all-division-screen";
const String faq = "/faq-screen";
const String howToUse = "/how-to-use-screen";
const String aboutApp = "/about-app-screen";
const String bottomHome = "/bottom-home-screen";
const String news = "/news-screen";
const String hourByWeather = "/hours-by-weather-screen";
const String sevnDaysWeather = "/seven-days-weather-screen";

//control your page route

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: mainHome, page: () => MainHome()),
  GetPage(name: faq, page: () => FaqScreen()),
  GetPage(name: howToUse, page: () => HowToUse()),
  GetPage(name: allDivision, page: () => AllDivision()),
  GetPage(name: aboutApp, page: () => AboutApp()),
  GetPage(name: bottomHome, page: () => BottomHome()),
  GetPage(name: news, page: () => NewsScreen()),
];
