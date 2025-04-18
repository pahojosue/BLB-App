import 'package:blb/common/widgets/Items/Item_card/blb_search_container.dart';
import 'package:blb/common/widgets/Items/Item_card/borrowed_item_card_vertical.dart';
import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/Items/Item_card/search_container_view_model.dart';
import 'package:blb/common/widgets/Items/item_card_receipt.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:blb/features/blb_app/controllers/items/item_controller.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorrowedItemsScreen extends StatelessWidget {
  const BorrowedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemController());
    controller.fetchBorrowedItems();
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
                      title: Text("Borrowed Items",
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
                    itemCount: controller.itemsBorrowed.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return BLBBorrowedItemCardVertical(
                          item: controller.itemsBorrowed[index]);
                    },
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
