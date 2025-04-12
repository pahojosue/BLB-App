import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BLBShimmerEffect extends StatelessWidget {
  const BLBShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  }) : super(key: key);

  final double width, height, radius;
  final Color? color;
  
  get Shimmer => null;

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child:Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? BLBColors.darkGrey : BLBColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),

      ) 
    );
  }
}