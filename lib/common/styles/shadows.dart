import 'package:blb/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BLBShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: BLBColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
