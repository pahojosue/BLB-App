import 'package:blb/utils/theme/custom_themes/appbar_theme.dart';
import 'package:blb/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:blb/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:blb/utils/theme/custom_themes/chip_theme.dart';
import 'package:blb/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:blb/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:blb/utils/theme/custom_themes/text_field_theme.dart';
import 'package:blb/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class BLBAppTheme {
  BLBAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: '',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: BLBTextTheme.lightTextTheme,
    chipTheme: BLBChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: BLBAppBarTheme.lightAppBarTheme,
    checkboxTheme: BLBCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: BLBBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BLBElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BLBOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BLBTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: '',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: BLBTextTheme.darkTextTheme,
    chipTheme: BLBChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: BLBAppBarTheme.darkAppBarTheme,
    checkboxTheme: BLBCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: BLBBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BLBElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BLBOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BLBTextFormFieldTheme.darkInputDecorationTheme,
  );
}
