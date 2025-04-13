import 'package:blb/features/personalisation/controllers/user_controller.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BLBSocialButtons extends StatelessWidget {
  const BLBSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: BLBColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            // onPressed: () => googleSignIn(),
            onPressed: () {},
            icon: const Image(
              width: BLBSizes.iconMd,
              height: BLBSizes.iconMd,
              image: AssetImage(BLBImages.google),
            ),
          ),
        ),
        const SizedBox(width: BLBSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: BLBColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: BLBSizes.iconMd,
              height: BLBSizes.iconMd,
              image: AssetImage(BLBImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
