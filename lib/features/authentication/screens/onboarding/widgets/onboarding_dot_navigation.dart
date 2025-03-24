import 'package:blb/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/device/device_utility.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = BLBHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: BLBDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: BLBSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? BLBColors.light : BLBColors.primary,
          dotHeight: 6,
        ),
      ),
    );
  }
}
