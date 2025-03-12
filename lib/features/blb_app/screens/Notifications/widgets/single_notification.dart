import 'package:blb/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:blb/features/blb_app/screens/UserView/userview.dart';
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
  });

  final String title, subtitle;
  final bool pressed;
  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => Userview()),
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
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
