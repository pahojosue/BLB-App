import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/appbar/notifications_menu_icon.dart';
import 'package:blb/features/blb_app/controllers/items/item_controller.dart';
import 'package:blb/features/blb_app/screens/Notifications/notifications.dart';
import 'package:blb/features/blb_app/screens/wishlist/wishlist.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BLBHomeAppBar extends StatelessWidget {
  const BLBHomeAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = ItemController.instance;
    final dark = BLBHelperFunctions.isDarkMode(context);
    return BLBAppBar(
      showBackArrow: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SearchBar
          Expanded(
            child: Form(
              key: controller.itemFormKey,
              child: TextFormField(
                controller: controller.searchQuery,
                decoration: const InputDecoration(labelText: "Search an item"),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: controller.fetchSearchedItems, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () =>
                Get.to(() => FavouriteScreen(item: ItemModel.empty())),
            icon: Icon(Iconsax.heart)),
        BLBNotificationsCounterIcon(
            onPressed: () => Get.to(() => const NotificationsScreen()),
            iconColor: dark ? BLBColors.white : BLBColors.black),
      ],
    );
  }
}
