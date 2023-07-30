import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
// Thame App

class Themes {
  static final light = ThemeData(
      primaryColor: primaryClr,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleSpacing: 20,
        titleTextStyle: TextStyle(color: Colors.black),
        centerTitle: true,
      ),
      brightness: Brightness.light);

  static final dark = ThemeData(
      primaryColor: darkGreyClr,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 70,
        titleSpacing: 20,
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
      ),
      backgroundColor: darkGreyClr,
      brightness: Brightness.dark);
// NotificationsScrean
  TextStyle get appBarTtext {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : darkGreyClr,
      fontSize: 30,
      fontWeight: FontWeight.w800,
    ));
  }

  TextStyle get bodytext {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
            fontSize: 26,
            fontWeight: FontWeight.w900));
  }

  TextStyle get time {
    return GoogleFonts.lato(
      textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
          fontSize: 20,
          fontWeight: FontWeight.w900),
    );
  }

  TextStyle get bodytext1 {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
            fontSize: 18,
            fontWeight: FontWeight.w300));
  }

  TextStyle get CountTtext {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      color: Colors.white,
      fontSize: 30,
    ));
  }

  TextStyle get titleC {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800));
  }

  TextStyle get descriptionC {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ));
  }
}

class ThemesServices {
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';
  _SaveThemeToBox(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }

  bool _loadThemeFromBox() {
    return _box.read<bool>(_key) ?? false;
  }

  void swicthTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _SaveThemeToBox(!_loadThemeFromBox());
  }
}
// NotificationsScrean

SizedBox bSize = const SizedBox(
  height: 10,
);

SizedBox bSize1 = const SizedBox(
  height: 20,
);
SizedBox CSize = const SizedBox(
  width: 20,
);
