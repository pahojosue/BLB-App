import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/device/device_utility.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            children: [
              OnBoardingPage(
                image: BLBImages.onBoardingImage1,
                title: BLBTexts.onBoardingTitle1,
                subTitle: BLBTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: BLBImages.onBoardingImage2,
                title: BLBTexts.onBoardingTitle2,
                subTitle: BLBTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: BLBImages.onBoardingImage3,
                title: BLBTexts.onBoardingTitle3,
                subTitle: BLBTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          Positioned(
            top: BLBDeviceUtils.getAppBarHeight(),
            right: BLBSizes.defaultSpace,
            child: TextButton(
              onPressed: () {},
              child: const Text('Skip'),
            ),
          ),

          /// Dot Navigation SmoothPageIndicator

          /// Circular Button
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(BLBSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              width: BLBHelperFunctions.screenWidth() * 0.8,
              height: BLBHelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: BLBSizes.spaceBtwItems),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
