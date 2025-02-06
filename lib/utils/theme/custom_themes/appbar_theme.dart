import 'package:flutter/material.dart';
import 'package:blb/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class BLBAppBarTheme {
  BLBAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: BLBColors.black, size: BLBSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: BLBColors.black, size: BLBSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: BLBColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: BLBColors.black, size: BLBSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: BLBColors.white, size: BLBSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: BLBColors.white),
  );
}
