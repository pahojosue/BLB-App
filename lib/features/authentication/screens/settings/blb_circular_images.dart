import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BLBCircularImages extends StatelessWidget{

  const BLBCircularImages({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = BLBSizes.sm,
    this.isNetworkImage = false,
  });
  
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (BLBHelperFunctions.isDarkMode(context) ? BLBColors.black : BLBColors.white),
        borderRadius: BorderRadius.circular(100),
),
child: Center(
  child: Image(
    fit: fit,
    image: isNetworkImage ? NetworkImage(image) :AssetImage(image) as ImageProvider,
    color: overlayColor,
  )
  ),
    );
  }
}