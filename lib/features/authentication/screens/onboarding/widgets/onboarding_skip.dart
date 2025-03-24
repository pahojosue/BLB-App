import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:blb/features/authentication/controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: BLBDeviceUtils.getAppBarHeight(),
      right: BLBSizes.defaultSpace,
      child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text('Skip')),
    );
  }
}
