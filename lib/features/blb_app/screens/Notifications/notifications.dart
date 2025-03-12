import 'package:blb/common/widgets/Items/Item_card/item_card_vertical.dart';
import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/features/blb_app/screens/Notifications/widgets/single_notification.dart';
import 'package:blb/features/blb_app/screens/home/home.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BLBAppBar(
          showBackArrow: true,
          title: Text("Notifications",
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),
          child: Column(
            children: [
              BLBSingleNotification(
                  title: BLBTexts.borrowingRequestTitle,
                  subtitle: BLBTexts.borrowingRequestSubtitle("Rania"),
                  pressed: false),
              BLBSingleNotification(
                  title: BLBTexts.borrowingRequestTitle,
                  subtitle: BLBTexts.borrowingRequestSubtitle("Paho"),
                  pressed: true),
              BLBSingleNotification(
                  title: BLBTexts.borrowingRequestTitle,
                  subtitle: BLBTexts.borrowingRequestSubtitle("Paul"),
                  pressed: false),
            ],
          ),
        ),
      ),
    );
  }
}
