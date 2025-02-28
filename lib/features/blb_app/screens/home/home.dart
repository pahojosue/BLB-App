import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/custom_shapes/containers/home_header_container.dart';
import 'package:blb/features/blb_app/screens/home/widgets/home_app_bar.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BLBHomeHeaderContainer(
              height: 106,
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
