import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:blb/navigation_menu.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header part
            BLBPrimaryHeaderContainer(
              height: 200,
              child: Column(
                children: [
                  //AppLogo
                  Padding(
                    padding: EdgeInsets.fromLTRB(100, 50, 20, 20),
                    child: Row(
                      children: [
                        Text(
                          "BLB APP",
                          style: TextStyle(
                              fontSize: BLBSizes.sm * 2,
                              fontWeight: FontWeight.bold),
                        ),
                        Image(image: AssetImage(BLBImages.darkLogo)),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Body part
            Padding(
              padding: const EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  //Title
                  Text("Create Account",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: TextStyle(fontSize: BLBSizes.md)),
                      TextButton(
                          onPressed: () => Get.to(() => LoginScreen()),
                          child: Text("Log In")),
                    ],
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwSections),

                  //Form
                  BLBSignupForm(dark: dark),

                  SizedBox(height: BLBSizes.spaceBtwItems),

                  //Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Divider(
                          color: dark ? BLBColors.darkGrey : BLBColors.grey,
                          thickness: 0.5,
                          indent: 15,
                          endIndent: 10,
                        ),
                      ),
                      Text("Or Register With",
                          style: Theme.of(context).textTheme.labelMedium),
                      Flexible(
                        child: Divider(
                          color: dark ? BLBColors.darkGrey : BLBColors.grey,
                          thickness: 0.5,
                          indent: 10,
                          endIndent: 15,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: BLBSizes.spaceBtwItems),
                  //Footers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: BLBColors.grey),
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            width: BLBSizes.iconLg,
                            height: BLBSizes.iconLg,
                            image: AssetImage(BLBImages.google),
                          ),
                        ),
                      ),
                      const SizedBox(width: BLBSizes.spaceBtwItems),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: BLBColors.grey),
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            width: BLBSizes.iconLg,
                            height: BLBSizes.iconLg,
                            image: AssetImage(BLBImages.facebook),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Skip For Now
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Get.to(() => NavigationMenu()),
                        child: Text(
                          "Skip for now",
                          style: TextStyle(
                              fontSize: BLBSizes.md,
                              color: dark ? BLBColors.white : BLBColors.dark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
