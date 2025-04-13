import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BLBAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: BLBSizes.gridViewSpacing,
                  crossAxisSpacing: BLBSizes.gridViewSpacing,
                  mainAxisExtent: 300,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 6,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return BLBItemCardVertical(item: item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
