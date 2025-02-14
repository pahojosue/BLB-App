import 'package:blb/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(BLBSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(BLBTexts.forgotPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: BLBSizes.spaceBtwItems),
            Text(BLBTexts.forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: BLBSizes.spaceBtwSections * 2),

            //Text field
            TextFormField(
              decoration: const InputDecoration(
                labelText: BLBTexts.email,
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: BLBSizes.spaceBtwSections),

            //static button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => ResetPassword()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                      side: BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
                  child: Text(
                    BLBTexts.submit,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
