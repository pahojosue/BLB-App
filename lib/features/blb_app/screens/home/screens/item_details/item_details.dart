import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/common/widgets/icons/blb_circular_icon.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:blb/common/widgets/custom_shapes/curved_shapes/curved_edges_widget.dart';
import 'package:iconsax/iconsax.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = BLBHelperFunctions.isDarkMode(context);
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
                        height: 400,
                        child: Padding(
                          padding:
                              EdgeInsets.all(BLBSizes.productImageRadius * 2),
                          child: Center(
                              child:
                                  Image(image: AssetImage(BLBImages.appLogo))),
                        )),

                    //Image Slider
                    Positioned(
                      right: 0,
                      bottom: 30,
                      left: BLBSizes.defaultSpace,
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated(
                          itemCount: 6,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: BLBSizes.spaceBtwItems),
                          itemBuilder: (_, index) => BLBRoundedImage(
                            width: 80,
                            backgroundColor:
                                isDark ? BLBColors.dark : BLBColors.white,
                            border: Border.all(color: BLBColors.primary),
                            padding: const EdgeInsets.all(BLBSizes.sm),
                            imageUrl: BLBImages.appLogo,
                          ),
                        ),
                      ),
                    ),

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
                  //Rating & share
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Rating
                      Row(
                        children: [
                          Icon(Iconsax.star5, color: Colors.amber, size: 24),
                          SizedBox(width: BLBSizes.spaceBtwItems / 2),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: '5.0',
                                style: Theme.of(context).textTheme.bodyLarge),
                            const TextSpan(text: '(199)'),
                          ]))
                        ],
                      ),
                      //Share button
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share, size: BLBSizes.iconMd)),
                    ],
                  ),

                  //Price, title, stock, brand
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Price & Sale Price
                      Row(
                        children: [
                          //Sale Tag
                          BLBRoundedContainer(
                            radius: BLBSizes.sm,
                            backgroundColor:
                                BLBColors.secondary.withValues(alpha: 0.8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: BLBSizes.sm, vertical: BLBSizes.xs),
                            child: Text('25%',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(color: BLBColors.black)),
                          ),
                          const SizedBox(width: BLBSizes.spaceBtwItems),

                          //Price
                          Text('\$250',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: BLBSizes.spaceBtwItems),
                          Text('\$175',
                              style: Theme.of(context).textTheme.titleSmall)
                        ],
                      ),
                      const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),

                      //Title
                      Text('A good Logo'),
                      const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),

                      //Stock status
                      Row(
                        children: [
                          Text('Status'),
                          const SizedBox(width: BLBSizes.spaceBtwItems),
                          Text("In stock"),
                        ],
                      ),
                      const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),

                      //Brand
                      Row(
                        children: [
                          Text("Logo",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(width: BLBSizes.xs),
                          const Icon(Iconsax.verify5,
                              color: BLBColors.primary, size: BLBSizes.iconXs),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: BLBSizes.spaceBtwSections),

                  //Description
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwItems),
                  const Text("This is a good Logo"),

                  //Reviews
                  const Divider(),
                  const SizedBox(height: BLBSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reviews(199)",
                          style: Theme.of(context).textTheme.headlineMedium),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
