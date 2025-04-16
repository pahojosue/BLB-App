import 'package:blb/common/widgets/Items/Item_card/blb_search_container.dart';
import 'package:blb/common/widgets/Items/Item_card/lent_item_card_vertical.dart';
import 'package:blb/common/widgets/Items/Item_card/search_container_view_model.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:blb/features/blb_app/controllers/items/item_controller.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LentItemsScreen extends StatelessWidget {
  const LentItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    final controller = ItemController.instance;
    controller.fetchLentItems();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BLBPrimaryHeaderContainer(
              height: 106,
              child: Column(
                children: [
                  BLBAppBar(
                      showBackArrow: true,
                      title: Text("Lent Items",
                          style: Theme.of(context).textTheme.headlineMedium)),

                  /// --SearchBar
                  BLBSearchContainer(
                      text: 'Search item',
                      searchContainerModel: SearchContainerModel()),
                  SizedBox(height: BLBSizes.spaceBtwSections),
                ],
              ),
            ),

            //Receipt Item Cards

            SizedBox(height: BLBSizes.spaceBtwSections),
            Padding(
              padding: EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.itemsLent.length > 3
                        ? 3
                        : controller.itemsLent.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return BLBLentItemCardVertical(
                        item: controller.itemsLent[index],
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: BLBSizes.spaceBtwSections)
          ],
        ),
      ),
    );
  }
}
