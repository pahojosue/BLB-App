import 'package:blb/features/authentication/controllers/login/login_controller.dart';
import 'package:blb/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BLBLoginForm extends StatelessWidget {
  const BLBLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: BLBSizes.md - 4),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => BLBValidator.validateEmail(value),
              decoration: InputDecoration(
                labelText: "Enter Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: BLBSizes.spaceBtwInputFields * 1.5),
            //Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    BLBValidator.validateEmptyText("Password", value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: BLBTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: BLBSizes.spaceBtwInputFields / 2),

            //Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(BLBTexts.rememberMe),
                  ],
                ),
                //Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  // style: TextButton.styleFrom(
                  //     textStyle: TextStyle(fontSize: BLBSizes.md)),
                  child: const Text("Forgot Password"),
                ),
              ],
            ),
            const SizedBox(
              height: BLBSizes.sm,
            ),

            //Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                        side:
                            BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
                    child: Text(
                      BLBTexts.signIn,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                    ))),
            const SizedBox(height: BLBSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
