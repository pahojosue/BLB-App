import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BLBGridLayout extends StatelessWidget {
  const BLBGridLayout({
    super.key,
    required this.BLBGridLayoutModel, required int itemCount, required SizedBox Function(dynamic _, dynamic __) itemBuilder,
  });
  final BLBGridLayout BLBGridLayoutModel;

  Widget Function(BuildContext, int) get itemBuilder => (context, index) {
        // Replace with your actual item building logic
        return Container(
          color: Colors.blue,
          child: Center(child: Text('Item $index')),
        );
      };

  int get ItemCount => 0; // Replace 0 with the actual logic or value for item count
  
  get mainAxisExtent => null;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: BLBGridLayoutModel.ItemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: BLBSizes.gridViewSpacing,
            crossAxisSpacing: BLBSizes.gridViewSpacing,
            mainAxisExtent: BLBGridLayoutModel.mainAxisExtent,
            crossAxisCount: 2),
        itemBuilder: BLBGridLayoutModel.itemBuilder);
  }
}
