import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(BLBSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(BLBImages.deliveredEmailIllustration),
              width: BLBHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: BLBSizes.spaceBtwSections),

            //Title and SubTitle
            Text(BLBTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: BLBSizes.spaceBtwItems),
            Text(BLBTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: BLBSizes.spaceBtwSections),

            //Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
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
                  onPressed: () {}, child: Text(BLBTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
