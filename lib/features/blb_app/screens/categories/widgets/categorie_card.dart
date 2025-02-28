import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BLBCategorieCard extends StatelessWidget {
  const BLBCategorieCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(BLBSizes.md),
        child: BLBRoundedContainer(
          height: 100,
          backgroundColor: dark ? BLBColors.dark : BLBColors.light,
          child: Row(
            children: [
              const BLBRoundedImage(
                  imageUrl: BLBImages.clothIcon, applyImageRadius: true),
              SizedBox(
                width: 80,
                child: Text(
                  "Ustensils",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: BLBSizes.md,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
