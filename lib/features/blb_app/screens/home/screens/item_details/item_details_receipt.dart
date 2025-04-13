import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ItemDetailsReceipt extends StatelessWidget {
  const ItemDetailsReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Appbar Icons
            BLBAppBar(
              showBackArrow: true,
              title: Text("Item's Receipt",
                  style: Theme.of(context).textTheme.headlineMedium),
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
                      Text("<<Item ID>>",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall),

                      const SizedBox(height: BLBSizes.spaceBtwItems),
                      Text("<<Item Name>>",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall),

                      const SizedBox(height: BLBSizes.spaceBtwItems),

                      Text("<<Lender Name>>",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall),

                      const SizedBox(height: BLBSizes.spaceBtwItems),
                      Row(
                        children: [
                          Text('<<Address:>>',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                          Text('<<Address>>',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                      const SizedBox(height: BLBSizes.spaceBtwItems),
                      //Item status
                      Row(
                        children: [
                          Text('<<Item State : >>',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                          Text('<<Fairly used>>',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                      const SizedBox(height: BLBSizes.spaceBtwItems),
                      Text("Lending Period :" " <<>>",
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
                        child: Text('Lent to:',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ),
                      const SizedBox(height: BLBSizes.spaceBtwItems),

                      Text("<<Client Name>>",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall),

                      const SizedBox(height: BLBSizes.spaceBtwItems),
                      Row(
                        children: [
                          Text('<<Address:>>',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                          Text('<<Address>>',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                      const SizedBox(height: BLBSizes.spaceBtwItems),
                      //Item status
                      Row(
                        children: [
                          Text('<<Date : >>',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(width: BLBSizes.spaceBtwItems / 1.5),
                          Text('<<April 9, 2025>>',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                      const SizedBox(height: BLBSizes.spaceBtwItems),
                    ],
                  ),

                  const SizedBox(height: BLBSizes.spaceBtwSections),

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
