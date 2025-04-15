import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/icons/blb_circular_icon.dart';
import 'package:blb/features/authentication/controllers/favourites_controller.dart';
import 'package:blb/features/blb_app/screens/home/home.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, required this.item});
  final ItemModel item;


  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(

      appBar: BLBAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              BLBCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
            ],
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),

          // Items Grid
          child: FutureBuilder(
            future: controller.favoriteItems(),
            builder: (context, snapshot) {

                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                   itemBuilder: (_, index) => BLBItemCardVertical(item: ItemModel.empty());
                    
                    
                     }
                  );
                     }
                   ),
               ),
                  
            ),
        );         
            
     }
          
}

