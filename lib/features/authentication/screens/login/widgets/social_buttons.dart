import 'package:blb/features/authentication/controllers/login/login_controller.dart';
import 'package:blb/features/authentication/controllers/login/login_controller.dart' as controller;
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BLBSocialButtons extends StatelessWidget {
  const BLBSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: BLBColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: BLBSizes.iconMd,
              height: BLBSizes.iconMd,
              image: AssetImage(BLBImages.google),
            ),
          ),
        ),
        const SizedBox(width: BLBSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: BLBColors.grey), borderRadius: BorderRadius.circular(100)),
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