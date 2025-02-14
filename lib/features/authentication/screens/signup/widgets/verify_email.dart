import 'package:blb/common/widgets/success_screen/success_screen1.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image: AssetImage(BLBImages.deliveredEmailIllustration),
                width: BLBHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: BLBSizes.spaceBtwSections),

              //Title and SubTitle
              Text(BLBTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BLBSizes.spaceBtwItems),
              Text('support@blbapp.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: BLBSizes.spaceBtwItems),
              Text(BLBTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BLBSizes.spaceBtwSections),

              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const SuccessScreen()),
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
              const SizedBox(height: BLBSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(BLBTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
