import 'package:flutter/material.dart';
import 'package:blb/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class BLBTextFormFieldTheme {
  BLBTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: BLBColors.darkGrey,
    suffixIconColor: BLBColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: BLBSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: BLBSizes.fontSizeMd, color: BLBColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: BLBSizes.fontSizeSm, color: BLBColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: BLBColors.black.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: BLBColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: BLBColors.darkGrey,
    suffixIconColor: BLBColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: BLBSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: BLBSizes.fontSizeMd, color: BLBColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: BLBSizes.fontSizeSm, color: BLBColors.white),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: BLBColors.white.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: BLBColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(BLBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: BLBColors.warning),
    ),
  );
}
