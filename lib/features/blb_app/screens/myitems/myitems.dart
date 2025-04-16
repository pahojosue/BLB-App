import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/blb_app/screens/myitems/widget/bartered_items.dart';
import 'package:blb/features/blb_app/screens/myitems/widget/borrowed_items.dart';
import 'package:blb/features/blb_app/screens/myitems/widget/lent_items.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyitemsScreen extends StatelessWidget {
  const MyitemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text(
            BLBTexts.loginRequired,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BLBPrimaryHeaderContainer(
                height: 106,
                child: Column(
                  children: [
                    BLBAppBar(
                        title: Center(
                      child: Text('My Items',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: BLBColors.white)),
                    )),

                    // /// --SearchBar
                    // BLBSearchContainer(
                    //     text: 'Search item',
                    //     searchContainerModel: SearchContainerModel()),
                    SizedBox(height: BLBSizes.spaceBtwSections),
                  ],
                ),
              ),

              /// Body
              Padding(
                padding: const EdgeInsets.all(BLBSizes.defaultSpace),
                //Borrowed Items
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: BLBHelperFunctions.screenHeight() / 7,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => BorrowedItemsScreen()),
                          child: Text("Borrowed Items")),
                    ),
                  ],
                ),
              ),

              //Lent Items
              Padding(
                padding: const EdgeInsets.all(BLBSizes.defaultSpace),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: BLBHelperFunctions.screenHeight() / 7,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => LentItemsScreen()),
                          child: Text("Lent Items")),
                    ),
                  ],
                ),
              ),

              //Bartered Itens
              Padding(
                padding: const EdgeInsets.all(BLBSizes.defaultSpace),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: BLBHelperFunctions.screenHeight() / 7,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => BarteredItemsScreen()),
                          child: Text("Bartered Items")),
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
}
