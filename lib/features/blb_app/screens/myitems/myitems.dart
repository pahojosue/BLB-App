import 'package:blb/common/widgets/Items/Item_card/blb_search_container.dart';
import 'package:blb/common/widgets/Items/Item_card/search_container_view_model.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:blb/features/authentication/screens/settings/blb_section_heading.dart';
import 'package:blb/features/blb_app/screens/home/screens/item_details/item_details.dart';
import 'package:blb/features/blb_app/screens/myitems/widget/bartered_items.dart';
import 'package:blb/features/blb_app/screens/myitems/widget/borrowed_items.dart';
import 'package:blb/features/blb_app/screens/myitems/widget/lent_items.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyitemsScreen extends StatelessWidget {
  const MyitemsScreen({super.key});

  get controller => null;

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
                  BLBAppBar(
                      title: Text('My Items',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: BLBColors.white))),

                  /// --SearchBar
                  BLBSearchContainer(
                      text: 'Search item',
                      searchContainerModel: SearchContainerModel()),
                  SizedBox(height: BLBSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  BLBSectionHeading(
                      title: 'Borrowed Items',
                      onPressed: () => Get.to(() => BorrowedItemsScreen())),
                  SizedBox(height: BLBSizes.spaceBtwItems),
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, _) =>
                            controller.updatePageIndicator(index)),
                    items: [
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner1,
                          onPressed: () => Get.to(() => ItemDetails())),
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner8,
                          onPressed: () => Get.to(() => ItemDetails())),
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner5,
                          onPressed: () => Get.to(() => ItemDetails())),
                    ],
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwItems),
                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        const BLBCircularContainer(
                            width: 20,
                            height: 4,
                            margin: EdgeInsets.only(right: 10),
                            backgroundColor: Colors.green,
                            image: ''),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  BLBSectionHeading(
                      title: 'Lent Items',
                      onPressed: () => Get.to(() => LentItemsScreen())),
                  SizedBox(height: BLBSizes.spaceBtwItems),
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, _) =>
                            controller.updatePageIndicator(index)),
                    items: [
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner2,
                          onPressed: () => Get.to(() => ItemDetails())),
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner4,
                          onPressed: () => Get.to(() => ItemDetails())),
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner6,
                          onPressed: () => Get.to(() => ItemDetails())),
                    ],
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwItems),
                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        const BLBCircularContainer(
                            width: 20,
                            height: 4,
                            margin: EdgeInsets.only(right: 10),
                            backgroundColor: Colors.green,
                            image: ''),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  BLBSectionHeading(
                      title: 'Bartered Items',
                      onPressed: () => Get.to(() => BarteredItemsScreen())),
                  SizedBox(height: BLBSizes.spaceBtwItems),
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                    ),
                    items: [
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner7,
                          onPressed: () => Get.to(() => ItemDetails())),
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner4,
                          onPressed: () => Get.to(() => ItemDetails())),
                      BLBRoundedImage(
                          imageUrl: BLBImages.banner6,
                          onPressed: () => Get.to(() => ItemDetails())),
                    ],
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwItems),
                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        const BLBCircularContainer(
                            width: 20,
                            height: 4,
                            margin: EdgeInsets.only(right: 10),
                            backgroundColor: Colors.green,
                            image: ''),
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
