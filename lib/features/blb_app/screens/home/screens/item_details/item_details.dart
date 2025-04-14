import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/icons/blb_circular_icon.dart';
import 'package:blb/features/blb_app/controllers/items/item_controller.dart';
import 'package:blb/features/blb_app/controllers/notifications/notification_controller.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blb/common/widgets/custom_shapes/curved_shapes/curved_edges_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final isDark = BLBHelperFunctions.isDarkMode(context);
    final user = FirebaseAuth.instance.currentUser;
    final controller = ItemController.instance;
    final notifController = Get.put(NotificationController());

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
        bottomNavigationBar: user.uid == item.ownerId
            ? Text("This is your Item")
            : Padding(
                padding: EdgeInsets.only(left: 48, right: 48, bottom: 12),
                child: ElevatedButton(
                  onPressed: () => notifController.sendNotificationDetails(
                      item.ownerId, item),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(BLBSizes.md),
                      backgroundColor: BLBColors.primary,
                      side: BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
                  child: const Text("Borrow"),
                ),
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Item Image Slider

              BLBCurvedEdgeWidget(
                child: Container(
                  color: isDark ? BLBColors.darkGrey : BLBColors.light,
                  child: Stack(
                    children: [
                      //Main Large Image
                      SizedBox(
                          height: 300,
                          child: Padding(
                            padding:
                                EdgeInsets.all(BLBSizes.productImageRadius * 2),
                            child: Center(
                                child:
                                    Image(image: NetworkImage(item.imageUrl))),
                          )),

                      //Appbar Icons
                      BLBAppBar(
                        showBackArrow: true,
                        actions: [
                          BLBCircularIcon(
                            icon: Iconsax.heart5,
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              //Item details
              Padding(
                padding: EdgeInsets.only(
                    right: BLBSizes.defaultSpace,
                    left: BLBSizes.defaultSpace,
                    bottom: BLBSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Price, title, stock, brand
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Title
                        Center(
                          child: Text(item.name,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ),
                        const SizedBox(height: BLBSizes.spaceBtwItems),

                        Row(
                          children: [
                            Text("Lender's Name: ",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                            FutureBuilder(
                                future: controller.getLenderName(item.ownerId),
                                builder: (context, snapshot) {
                                  return Text(snapshot.data.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall);
                                }),
                          ],
                        ),

                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        Row(
                          children: [
                            Text('Address: ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                            FutureBuilder(
                                future:
                                    controller.getLenderAddress(item.ownerId),
                                builder: (context, snapshot) {
                                  return Text(snapshot.data.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall);
                                }),
                          ],
                        ),
                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        //Item status
                        Row(
                          children: [
                            Text('Item State : ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                            Text(item.state,
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        Text(
                            "Minimum Lending Period : ${item.lendingPeriod} day(s)",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headlineSmall),

                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        Text("Price per day : ${item.price} XAF",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),

                    const SizedBox(height: BLBSizes.spaceBtwSections),
                    Center(
                      child: Text("Description",
                          style: Theme.of(context).textTheme.headlineMedium),
                    ),
                    SizedBox(
                        height: 75,
                        child: Text(
                          item.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
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
