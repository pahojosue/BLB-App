import 'package:blb/common/widgets/Items/Item_card/blb_search_container.dart';
import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/Items/Item_card/search_container_view_model.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarteredItemsScreen extends StatelessWidget {
  const BarteredItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

           BLBPrimaryHeaderContainer(
            height: 106,
            child: Column(
              children: [
  BLBAppBar(showBackArrow: true, title: Text("Bartered Items", style: Theme.of(context).textTheme.headlineMedium)),
/// --SearchBar
       BLBSearchContainer(text: 'Search item', searchContainerModel: SearchContainerModel()),
        SizedBox(height: BLBSizes.spaceBtwSections),
          ],
        
      ),

      ),

      //Vertical Item Cards
            SizedBox(height: BLBSizes.spaceBtwSections),
            Padding(
              padding: EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return BLBItemCardVertical();
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




