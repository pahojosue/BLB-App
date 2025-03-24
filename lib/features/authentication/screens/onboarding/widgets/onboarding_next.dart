import 'package:blb/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/device/device_utility.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return Positioned(
      right: BLBSizes.defaultSpace,
      bottom: BLBDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? BLBColors.primary : BLBColors.dark,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
