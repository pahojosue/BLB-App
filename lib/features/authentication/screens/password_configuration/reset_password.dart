import 'package:blb/features/authentication/controllers/forgot_password/forgot_password_cntroller.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(BLBSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(BLBImages.deliveredEmailIllustration),
              width: BLBHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: BLBSizes.spaceBtwSections),

            //Email, Title and SubTitle
            Text(email, style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: BLBSizes.spaceBtwItems),
            Text(BLBTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: BLBSizes.spaceBtwSections),
            Text(BLBTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: BLBSizes.spaceBtwSections),

            //Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                      side: BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
                  child: Text(
                    BLBTexts.done,
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
                  onPressed: () => ForgotPasswordController.instance.resendPasswordResetEmail(email), child: const Text(BLBTexts.resendEmail)),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
