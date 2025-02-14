import 'package:blb/common/styles/spacing_styles.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BLBSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //Image
              Image(
                image: AssetImage(BLBImages.staticSuccessIllustration),
                width: BLBHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: BLBSizes.spaceBtwSections),

              //Title and SubTitle
              Text(BLBTexts.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BLBSizes.spaceBtwItems),
              Text(BLBTexts.yourAccountCreatedSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BLBSizes.spaceBtwSections),

              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                        side:
                            BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
