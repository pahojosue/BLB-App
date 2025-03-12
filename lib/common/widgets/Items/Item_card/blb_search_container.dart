import 'package:blb/common/widgets/Items/Item_card/search_container_view_model.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/device/device_utility.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BLBSearchContainer extends StatelessWidget {
  const BLBSearchContainer({
    super.key,
    required this.searchContainerModel, required String text,
  });
  final SearchContainerModel searchContainerModel;
  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return Padding(
      padding: searchContainerModel.padding,
      child: GestureDetector(
        onTap: searchContainerModel.onPressed,
        child: Container(
          width: BLBDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(BLBSizes.md),
          decoration: BoxDecoration(
            color: searchContainerModel.showBackground
                ? dark
                    ? BLBColors.dark
                    : BLBColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(BLBSizes.cardRadiusLg),
            border: searchContainerModel.showBorder
                ? Border.all(
                    color: BLBColors.grey,
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(searchContainerModel.icon, color: BLBColors.darkGrey),
              const SizedBox(width: BLBSizes.spaceBtwItems),
              Text(
                searchContainerModel.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//search container model
