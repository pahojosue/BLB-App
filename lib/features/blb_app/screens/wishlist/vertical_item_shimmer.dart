import 'package:blb/features/blb_app/screens/home/widgets/shimmer.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart'; 

class BLBVerticalItemShimmer extends StatelessWidget {
  const BLBVerticalItemShimmer({
    super.key,
    this.itemCount = 4,
  
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder( // Replace with GridView.builder if GridLayout is unavailable
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            
            BLBShimmerEffect(width: 180, height: 180),
            SizedBox(height: BLBSizes.spaceBtwItems / 2),

            /// Text
            BLBShimmerEffect(width: 160, height: 15),
            SizedBox(height: BLBSizes.spaceBtwItems / 2),
            BLBShimmerEffect(width: 110, height: 15),
          ],  
        ),
      ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: BLBSizes.gridViewSpacing,
        crossAxisSpacing: BLBSizes.gridViewSpacing,
        mainAxisExtent: 250, // Adjust this value as needed
      ),
        
           
    );
  }
}