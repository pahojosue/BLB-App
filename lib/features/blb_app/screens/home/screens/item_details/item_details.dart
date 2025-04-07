import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/icons/blb_circular_icon.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blb/common/widgets/custom_shapes/curved_shapes/curved_edges_widget.dart';
import 'package:iconsax/iconsax.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = BLBHelperFunctions.isDarkMode(context);
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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 48, right: 48, bottom: 12),
          child: ElevatedButton(
            onPressed: () {},
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
                      const SizedBox(
                          height: 300,
                          child: Padding(
                            padding:
                                EdgeInsets.all(BLBSizes.productImageRadius * 2),
                            child: Center(
                                child: Image(
                                    image: AssetImage(BLBImages.appLogo))),
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
                          child: Text('<<Item Name>>',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ),
                        const SizedBox(height: BLBSizes.spaceBtwItems),

                        Text("<<Lender Name>>",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headlineSmall),

                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        Row(
                          children: [
                            Text('<<Address:>>',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                            Text('<<Address>>',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        //Item status
                        Row(
                          children: [
                            Text('<<Item State : >>',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                            Text('<<Fairly used>>',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        Text("Minimum Lending Period :" " <<>>",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headlineSmall),

                        const SizedBox(height: BLBSizes.spaceBtwItems),
                        Text("Price per day :" " XAF",
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
                    const SizedBox(
                        height: 75,
                        child: Text(
                          "",
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
