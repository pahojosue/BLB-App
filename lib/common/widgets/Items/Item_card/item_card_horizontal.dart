import 'package:blb/common/styles/shadows.dart';
import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/features/blb_app/screens/home/screens/item_details/item_details.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BLBItemCardHorizontal extends StatelessWidget {
  const BLBItemCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ItemDetails(item: ItemModel.empty())),
      child: Container(
        width: BLBHelperFunctions.screenWidth(),
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [BLBShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(BLBSizes.productImageRadius),
          color: dark ? BLBColors.darkGrey : BLBColors.white,
        ),
        child: Row(
          children: [
            //Thumbnail
            BLBRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(BLBSizes.md),
              backgroundColor: dark ? BLBColors.dark : BLBColors.light,
              child: SizedBox(
                height: 120,
                width: 120,
                child: BLBRoundedImage(
                    imageUrl: BLBImages.appLogo, applyImageRadius: true),
              ),
            ),

            //Item details
            Padding(
              padding: EdgeInsets.only(top: BLBSizes.sm, left: BLBSizes.sm),
              child: const Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemTitleCard(title: "Good Logo to Buy"),
                      SizedBox(height: BLBSizes.spaceBtwItems / 2),
                      Text(
                        "500 XAF",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTitleCard extends StatelessWidget {
  const ItemTitleCard({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
