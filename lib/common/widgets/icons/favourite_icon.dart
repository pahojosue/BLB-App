import 'package:blb/common/widgets/icons/blb_circular_icon.dart';
import 'package:blb/features/authentication/controllers/favourites_controller.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BLBFavouriteIcon extends StatelessWidget {
  const BLBFavouriteIcon({
    super.key, required this.itemId,
    
  });

  final String itemId ; // Replace with actual item ID

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => BLBCircularIcon(
      icon: controller.isFavorite(itemId) ? Iconsax.heart5 : Iconsax.heart, 
      color: controller.isFavorite(itemId) ? BLBColors.error : null,
      onPressed: () => controller.toggleFavoriteItem(itemId),
      ),
      );
    
  }
}