import 'package:flutter/material.dart';

const Color blueIsColor = Color.fromARGB(255, 1, 1, 75);
const Color lightBotomNav = Color(0xFF000a3f);
const Color ywllowClr = Color(0xFFFFB746);
const Color darkGrayClr = Color.fromARGB(255, 15, 9, 9);
const Color darkheaderClr = Color.fromARGB(255, 0, 0, 0);
const Color lightbg = Color.fromARGB(255, 34, 47, 82);
const Color lightcardClr = Color.fromARGB(255, 13, 1, 82);
const Color darktcardClr = Color.fromARGB(255, 13, 13, 14);

class Themes {
  static final light = ThemeData(
      brightness: Brightness.light,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF000a3f),
      ),
      scaffoldBackgroundColor: lightbg,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(lightcardClr),
      )),
      cardTheme: CardTheme(color: Colors.white10),
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      appBarTheme: AppBarTheme(color: blueIsColor));

  static final dark = ThemeData(
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkheaderClr,
      ),
      scaffoldBackgroundColor: darkGrayClr,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(darktcardClr),
      )),
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      cardTheme: CardTheme(color: darktcardClr),
      appBarTheme: AppBarTheme(color: darkheaderClr));
}
