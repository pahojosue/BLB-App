import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/features/blb_app/controllers/notifications/notification_controller.dart';
import 'package:blb/features/blb_app/screens/UserView/userview.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BLBSingleNotification extends StatelessWidget {
  const BLBSingleNotification({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pressed,
    required this.notificationId,
    required this.ownerId,
    required this.borrowerId,
    required this.item,
  });

  final String title;
  final Future<String> subtitle;
  final bool pressed;
  final String notificationId;
  final String ownerId;
  final String borrowerId;
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    final controller = NotificationController.instance;
    return GestureDetector(
      onTap: () {
        Get.to(() =>
            Userview(ownerId: ownerId, borrowerId: borrowerId, item: item));
        controller.updateIsRead(notificationId);
      },
      child: BLBRoundedContainer(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(BLBSizes.md),
        showBorder: true,
        backgroundColor: pressed
            ? Colors.transparent
            : BLBColors.primary.withValues(alpha: 0.5),
        borderColor: dark ? BLBColors.darkerGrey : BLBColors.grey,
        margin: EdgeInsets.only(bottom: BLBSizes.spaceBtwItems),
        child: Column(
          children: [
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: BLBSizes.sm / 2),
            FutureBuilder(
                future: subtitle,
                builder: (context, snapshot) {
                  return Text(
                      "User ${snapshot.data.toString()} is interested in borrowing your item");
                }),
          ],
        ),
      ),
    );
  }
}
