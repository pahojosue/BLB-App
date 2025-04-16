import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/features/blb_app/controllers/favourites/favourites_controller.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;

    return Scaffold(
      appBar: BLBAppBar(
        showBackArrow: true,
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: FutureBuilder<List<ItemModel>>(
        future: controller.favoriteItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No items in your wishlist.'));
          }

          final items = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(BLBSizes.defaultSpace),
            child: GridView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 0.49,
              ),
              itemBuilder: (context, index) {
                return BLBItemCardVertical(item: items[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
