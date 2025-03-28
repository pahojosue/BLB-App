
import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))],
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
              Text(email ?? '',
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
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                        side:
                            BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),

                    child: const Text(BLBTexts.tContinue)),
                     ),                    
                    
              const SizedBox(height: BLBSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(), child: const Text(BLBTexts.resendEmail)),
              ),
            ],
              ),

              ),

              ),

        );
  }
}
