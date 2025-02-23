import 'package:blb/features/blb_app/screens/categories/widgets/categorie_card.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SearchBar
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: BLBSizes.appBarHeight, left: BLBSizes.md),
                    child: Container(
                      padding: const EdgeInsets.all(BLBSizes.lg),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(BLBSizes.cardRadiusLg),
                        border: Border.all(color: BLBColors.darkGrey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: BLBSizes.appBarHeight),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    iconSize: BLBSizes.iconLg,
                  ),
                ),
              ],
            ),

            SizedBox(height: BLBSizes.spaceBtwSections),
            //Categories Cards
            GridView.builder(
              itemCount: 12,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: BLBSizes.gridViewSpacing - 2,
                mainAxisExtent: 100,
              ),
              itemBuilder: (_, index) => BLBCategorieCard(),
            ),
          ],
        ),
      ),
    );
  }
}
