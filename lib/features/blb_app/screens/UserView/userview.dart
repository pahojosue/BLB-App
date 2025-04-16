import 'package:blb/common/widgets/Items/Item_card/user_view_item_card_horizontal.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/features/blb_app/controllers/userView/user_view_controller.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userview extends StatelessWidget {
  const Userview({
    super.key,
    required this.ownerId,
    required this.borrowerId,
    required this.item,
  });

  final String ownerId;
  final String borrowerId;
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserViewController());
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
              BLBUserViewItemCardHorizontal(item: item),
              const SizedBox(height: BLBSizes.spaceBtwSections * 2),

              //User details
              BLBRoundedContainer(
                backgroundColor: Colors.transparent,
                showBorder: true,
                padding: EdgeInsets.all(BLBSizes.defaultSpace),
                child: Column(
                  children: [
                    UserInfo(
                      title: "Name: ",
                      widget: FutureBuilder(
                          future: controller.getBorrowerName(borrowerId),
                          builder: (context, snapshot) {
                            return Text(snapshot.data.toString());
                          }),
                    ),
                    const SizedBox(height: BLBSizes.spaceBtwInputFields),
                    UserInfo(
                        title: "Location: ",
                        widget: FutureBuilder(
                            future: controller.getBorrowerAddress(borrowerId),
                            builder: (context, snapshot) {
                              return Text(snapshot.data.toString());
                            })),
                    const SizedBox(height: BLBSizes.spaceBtwInputFields),
                    Row(
                      children: [
                        Text("Borrowing Period: ",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(width: BLBSizes.spaceBtwItems),
                        Text("${item.lendingPeriod} day(s)"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: BLBSizes.spaceBtwSections),
              //Buttons
              SizedBox(
                width: BLBHelperFunctions.screenWidth(),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Buttons(
                              text: "Reject",
                              onPressed: () {},
                              color: Colors.red),
                          Buttons(
                              text: "Accept",
                              onPressed: () => controller.updateBorrowerId(
                                  item.id, borrowerId))
                        ],
                      ),
                    ),
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
    required this.widget,
  });

  final String title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(width: BLBSizes.spaceBtwItems),
        widget,
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
            onPressed: onPressed,
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
