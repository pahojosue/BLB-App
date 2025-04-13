import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class BLBChipTheme {
  BLBChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: BLBColors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: BLBColors.black),
    selectedColor: BLBColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: BLBColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: BLBColors.darkerGrey,
    labelStyle: TextStyle(color: BLBColors.white),
    selectedColor: BLBColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: BLBColors.white,
  );
}
