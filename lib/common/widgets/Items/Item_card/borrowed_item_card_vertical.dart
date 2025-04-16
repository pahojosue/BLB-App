import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/common/widgets/icons/favourite_icon.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/features/blb_app/controllers/items/item_controller.dart';
import 'package:blb/features/blb_app/screens/home/screens/item_details/item_details.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:blb/common/styles/shadows.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BLBBorrowedItemCardVertical extends StatelessWidget {
  const BLBBorrowedItemCardVertical({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final controller = ItemController.instance;
    final dark = BLBHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ItemDetails(item: item)),
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
                width: double.infinity,
                padding: const EdgeInsets.all(BLBSizes.sm),
                backgroundColor: dark ? BLBColors.dark : BLBColors.light,
                child: Stack(
                  children: [
                    //Thumbnail Image
                    Center(
                      child: BLBRoundedImage(
                          imageUrl: item.imageUrl,
                          applyImageRadius: true,
                          isNetworkImage: true),
                    ),
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
                      item.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: BLBSizes.spaceBtwItems / 2),
                    // Row(
                    //   children: [
                    //     // Text(name,
                    //     //     overflow: TextOverflow.ellipsis,
                    //     //     maxLines: 1,
                    //     //     style: Theme.of(context).textTheme.labelLarge),
                    //     FutureBuilder(
                    //         future: controller.getLenderName(item.ownerId),
                    //         builder: (context, snapshot) {
                    //           return Text(snapshot.data.toString());
                    //         }),
                    //     const SizedBox(width: BLBSizes.xs),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     //Price
                    //     Text(
                    //       "${item.price} XAF",
                    //       maxLines: 1,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: Theme.of(context).textTheme.headlineMedium,
                    //     ),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         color: BLBColors.dark,
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(6),
                    //           bottomRight:
                    //               Radius.circular(BLBSizes.productImageRadius),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
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
