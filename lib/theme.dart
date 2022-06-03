import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData ligthThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: backgroundColor,
      // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
      // .apply(bodyColor: kContentColorLigthTheme),
      iconTheme: const IconThemeData(color: kContentColorLigthTheme),
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor, 
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 14, color: primaryText, fontFamily: 'Poppins', fontWeight: FontWeight.w800),
        bodyText2: TextStyle(fontSize: 12, color: secondaryText, fontFamily: 'Poppins', fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 24, color: primaryText, fontFamily: 'Poppins', fontWeight: FontWeight.w800),
        headline2: TextStyle(fontSize: 22, color: secondaryText, fontFamily: 'Poppins', fontWeight: FontWeight.w800)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: kContentColorLigthTheme.withOpacity(0.7),
        unselectedItemColor: kContentColorLigthTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      ));
}