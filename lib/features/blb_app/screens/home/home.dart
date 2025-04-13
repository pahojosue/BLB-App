import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/custom_shapes/containers/home_header_container.dart';
import 'package:blb/features/blb_app/controllers/items/item_controller.dart';
import 'package:blb/features/blb_app/screens/home/widgets/home_app_bar.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemController());
    controller.fetchItems();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BLBHomeHeaderContainer(
              height: BLBHelperFunctions.screenHeight() * 0.12,
              child: Column(
                children: [
                  //AppBar
                  BLBHomeAppBar(),
                ],
              ),
            ),
            //Vertical Item Cards
            SizedBox(height: BLBSizes.spaceBtwSections),
            Padding(
              padding: EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: Text('Loading ...',
                            style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }

                    if (controller.items.isEmpty) {
                      return Center(
                        child: Text('No data found',
                            style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.items.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        return BLBItemCardVertical(
                            item: controller.items[index]);
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
