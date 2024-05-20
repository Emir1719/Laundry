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
      dialogTheme: _dialogTheme(),
    );
  }

  DialogTheme _dialogTheme() {
    return const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
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
        surfaceTintColor: MaterialStateProperty.resolveWith((states) {
          return Colors.transparent;
        }),
        fixedSize: MaterialStateProperty.all(const Size.fromHeight(45)),
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
      elevation: 5,
      actionsIconTheme: IconThemeData(color: _color.background),
      iconTheme: IconThemeData(color: _color.background, size: 24),
      color: _color.primary,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: _color.primary,
        statusBarIconBrightness: Brightness.light, //for android light icon
        statusBarBrightness: Brightness.dark, //for ios light icon
        systemNavigationBarColor: _color.background,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(50),
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
