import 'package:blb/features/authentication/controllers/forgot_password/forgot_password_cntroller.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
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
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: BLBValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: BLBTexts.email,
                prefixIcon: Icon(Icons.email),
              ),
              ),
            ),
            const SizedBox(height: BLBSizes.spaceBtwSections),

         
            //static button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail() , child: const Text(BLBTexts.submit)),
                 
            )
          ],
        ),
      ),
    );
  }
}
