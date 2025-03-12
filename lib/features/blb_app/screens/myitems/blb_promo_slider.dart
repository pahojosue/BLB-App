import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BLBPromoBannerCarouselSlider extends StatelessWidget {
  const BLBPromoBannerCarouselSlider({
    super.key, required images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BLBSizes.defaultSpace),
      child: BLBPromoBannerCarouselSlider(
        images: BLBImages().promoBannerImages,
      ),
    );
  }
}
