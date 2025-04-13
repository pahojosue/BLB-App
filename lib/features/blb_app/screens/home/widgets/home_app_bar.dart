import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/appbar/notifications_menu_icon.dart';
import 'package:blb/features/blb_app/screens/Notifications/notifications.dart';
import 'package:blb/features/blb_app/screens/wishlist/wishlist.dart';
import 'package:blb/features/personalisation/controllers/user_controller.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
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
    final controller = Get.put(UserController());
    final dark = BLBHelperFunctions.isDarkMode(context);
    return BLBAppBar(
      showBackArrow: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// Text(BLBTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color:BLBColors.grey)),
//          Obx(() {
//           if (controller.profileLoading.value) {
//             return const BLBShimmerEffect(height: 15, width: 80);
//           } else {
//             return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color:BLBColors.white));
//           }

//   }),

          //SearchBar
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: BLBSizes.md - 6),
              child: Container(
                padding: const EdgeInsets.all(BLBSizes.sm - 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(BLBSizes.cardRadiusLg),
                  border: Border.all(color: BLBColors.grey),
                ),
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.search,
                  color: BLBColors.darkGrey,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
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
