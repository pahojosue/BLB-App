import 'package:blb/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:blb/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:blb/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:blb/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: BLBImages.onBoardingImage1,
                title: BLBTexts.onBoardingTitle1,
                subTitle: BLBTexts.onBoardingSubTitle1,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator

          /// Circular Button
          OnBoardingNextButton()
        ],
      ),
    );
  }
}
