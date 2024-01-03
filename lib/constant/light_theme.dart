import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry/constant/color.dart';
import 'package:laundry/locator.dart';

class ThemeLight {
  final _color = locator<AppColor>();

  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: _color.background,
      primarySwatch: _color.primary,
      appBarTheme: _appBarTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      textButtonTheme: _textButtonThemeData(),
      textSelectionTheme: _textSelectionTheme(),
    );
  }

  TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: _color.primary,
      selectionColor: _color.primary,
      selectionHandleColor: _color.primary,
    );
  }

  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return _color.primary;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey.shade100;
          }
          return Colors.transparent;
        }),
      ),
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      elevation: 0,
      actionsIconTheme: IconThemeData(color: _color.primary),
      iconTheme: IconThemeData(color: _color.primary, size: 24),
      color: _color.background,
      titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: _color.background,
        statusBarIconBrightness: Brightness.dark, //for android light icon
        statusBarBrightness: Brightness.light, //for ios light icon
        systemNavigationBarColor: _color.background,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(45),
        backgroundColor: Colors.transparent,
        foregroundColor: _color.primary,
        shadowColor: Colors.transparent,
        side: BorderSide(width: 1, color: _color.primary),
        textStyle: TextStyle(fontSize: 16, color: _color.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
