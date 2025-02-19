import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/appbar/notifications_menu_icon.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/device/device_utility.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BLBHomeAppBar extends StatelessWidget {
  const BLBHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return BLBAppBar(
      showBackArrow: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image(image: AssetImage(BLBImages.appLogo)),
          ),

          SizedBox(width: BLBSizes.spaceBtwItems),
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
        Icon(Iconsax.heart),
        BLBNotificationsCounterIcon(
            onPressed: () {},
            iconColor: dark ? BLBColors.white : BLBColors.black),
      ],
    );
  }
}
