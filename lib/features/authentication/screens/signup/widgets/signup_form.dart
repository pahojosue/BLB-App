import 'package:blb/features/authentication/controllers/signup/signup_controller.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BLBSignupForm extends StatelessWidget {
  const BLBSignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //First and Last Name
          //First Name
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Icon(Iconsax.user),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      BLBValidator.validateEmptyText('First Name', value),
                  decoration:
                      const InputDecoration(labelText: BLBTexts.firstName),
                ),
              ),
            ],
          ),
          const SizedBox(height: BLBSizes.spaceBtwInputFields),
          //Last Name
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Icon(Iconsax.user),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      BLBValidator.validateEmptyText('Last Name', value),
                  decoration:
                      const InputDecoration(labelText: BLBTexts.lastName),
                ),
              ),
            ],
          ),
          const SizedBox(height: BLBSizes.spaceBtwInputFields),

          ///Username
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Icon(Iconsax.user_edit),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.userName,
                  validator: (value) =>
                      BLBValidator.validateEmptyText('Username', value),
                  decoration:
                      const InputDecoration(labelText: BLBTexts.username),
                ),
              ),
            ],
          ),
          const SizedBox(height: BLBSizes.spaceBtwInputFields),

          ///Email
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Icon(Iconsax.direct),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => BLBValidator.validateEmail(value),
                  decoration: const InputDecoration(labelText: BLBTexts.email),
                ),
              ),
            ],
          ),
          const SizedBox(height: BLBSizes.spaceBtwInputFields),

          ///Password
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Icon(Iconsax.password_check),
              ),
              Expanded(
                child: Obx(
                  () => TextFormField(
                    controller: controller.password,
                    validator: (value) => BLBValidator.validatePassword(value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      labelText: BLBTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: BLBSizes.spaceBtwInputFields),

          ///Phone Number
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Icon(Iconsax.call),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => BLBValidator.validatePhoneNumber(value),
                  decoration:
                      const InputDecoration(labelText: BLBTexts.phoneNo),
                ),
              ),
            ],
          ),
          const SizedBox(height: BLBSizes.spaceBtwInputFields),

          ///Address
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Icon(Iconsax.home),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      BLBValidator.validateEmptyText('Address', value),
                  controller: controller.address,
                  decoration: const InputDecoration(labelText: "Address"),
                ),
              ),
            ],
          ),
          const SizedBox(height: BLBSizes.spaceBtwSections),

          ///Terms & Conditions Checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Obx(() => Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (value) => controller.privacyPolicy.value =
                        !controller.privacyPolicy.value)),
              ),
              const SizedBox(width: BLBSizes.spaceBtwItems),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '${BLBTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: BLBTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? BLBColors.white : BLBColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? BLBColors.white : BLBColors.primary,
                        )),
                TextSpan(
                    text: ' ${BLBTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: BLBTexts.termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? BLBColors.white : BLBColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? BLBColors.white : BLBColors.primary,
                        )),
              ]))
            ],
          ),

          const SizedBox(height: BLBSizes.spaceBtwSections - 12),

          ///Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                      side: BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                  ))),
        ],
      ),
    );
  }
}
