import 'package:blb/common/widgets/Items/Item_card/item_card_horizontal.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/features/authentication/screens/settings/layouts/list_tiles/user_profile_tile.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Userview extends StatelessWidget {
  const Userview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BLBAppBar(
        showBackArrow: true,
        title: Text("Verify Request"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),
          child: Column(
            children: [
              //Item
              BLBItemCardHorizontal(),
              const SizedBox(height: BLBSizes.spaceBtwSections * 2),

              //User details
              BLBRoundedContainer(
                backgroundColor: Colors.transparent,
                showBorder: true,
                padding: EdgeInsets.all(BLBSizes.defaultSpace),
                child: Column(
                  children: [
                    UserInfo(title: "Name: ", result: "John"),
                    const SizedBox(height: BLBSizes.spaceBtwInputFields),
                    UserInfo(title: "Location: ", result: "Douala"),
                    const SizedBox(height: BLBSizes.spaceBtwInputFields),
                    UserInfo(title: "Borrowing Period: ", result: "2"),
                  ],
                ),
              ),

              const SizedBox(height: BLBSizes.spaceBtwSections),
              //Buttons
              SizedBox(
                width: BLBHelperFunctions.screenWidth(),
                child: Row(
                  children: [
                    Buttons(
                        text: "Reject", onPressed: () {}, color: Colors.red),
                    const SizedBox(width: BLBSizes.spaceBtwItems),
                    Buttons(text: "Accept", onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.title,
    required this.result,
  });

  final String title;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(width: BLBSizes.spaceBtwItems),
        Text(result),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromRGBO(53, 237, 237, 1),
  });

  final String text;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: BLBSizes.defaultSpace * 10,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: color, side: BorderSide(color: color)),
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            )));
  }
}
