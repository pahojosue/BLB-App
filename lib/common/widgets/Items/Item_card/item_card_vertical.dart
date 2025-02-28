import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/common/widgets/icons/blb_circular_icon.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:blb/common/styles/shadows.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BLBItemCardVertical extends StatelessWidget {
  const BLBItemCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(bottom: BLBSizes.spaceBtwItems),
        child: Container(
          width: BLBHelperFunctions.screenWidth(),
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [BLBShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(BLBSizes.productImageRadius),
            color: dark ? BLBColors.darkGrey : BLBColors.white,
          ),
          child: Column(
            children: [
              //Thumbnail (Image)
              BLBRoundedContainer(
                height: 140,
                padding: const EdgeInsets.all(BLBSizes.sm),
                backgroundColor: dark ? BLBColors.dark : BLBColors.light,
                child: Stack(
                  children: [
                    //Thumbnail Image
                    const BLBRoundedImage(
                        imageUrl: BLBImages.appLogo, applyImageRadius: true),
                    //Favorite Icon Button
                    Positioned(
                        top: 0,
                        right: 0,
                        child: const BLBCircularIcon(
                            icon: Iconsax.heart5, color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(height: BLBSizes.spaceBtwItems / 2),

              //Item Details
              Padding(
                padding: const EdgeInsets.only(left: BLBSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A good logo available for you",
                      style: Theme.of(context).textTheme.labelLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: BLBSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        Text("Logo",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(width: BLBSizes.xs),
                        const Icon(Iconsax.verify5,
                            color: BLBColors.primary, size: BLBSizes.iconXs),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Price
                        Text(
                          "500 XAF",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: BLBColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomRight:
                                  Radius.circular(BLBSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                              width: BLBSizes.iconLg * 1.1,
                              height: BLBSizes.iconLg * 1.1,
                              child: Center(
                                  child: Icon(Iconsax.add,
                                      color: BLBColors.white))),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
