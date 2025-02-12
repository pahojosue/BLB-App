import 'package:blb/common/styles/spacing_styles.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/screens/onboarding/onboarding.dart';
import 'package:blb/features/authentication/screens/signup/widgets/signup.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BLBHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header part
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
              padding: BLBSpacingStyles.paddingWithAppBarHeight,
              child: Column(
                children: [
                  //Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hello Again!",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text("Welcome back you've been missed!"),
                    ],
                  ),
                  SizedBox(height: BLBSizes.spaceBtwItems),

                  //Form
                  Form(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: BLBSizes.md - 4),
                      child: Column(
                        children: [
                          //Email
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                              suffixIcon: Icon(Icons.email),
                            ),
                          ),
                          const SizedBox(
                              height: BLBSizes.spaceBtwInputFields * 1.5),
                          //Password
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: BLBTexts.password,
                              suffixIcon: Icon(Iconsax.password_check),
                            ),
                          ),
                          const SizedBox(
                              height: BLBSizes.spaceBtwInputFields / 2),

                          //Remember Me & Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Remember me
                              Row(
                                children: [
                                  Checkbox(value: true, onChanged: (value) {}),
                                  const Text(BLBTexts.rememberMe),
                                ],
                              ),
                              //Forget Password
                              TextButton(
                                onPressed: () {},
                                // style: TextButton.styleFrom(
                                //     textStyle: TextStyle(fontSize: BLBSizes.md)),
                                child: const Text("Recover Password"),
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
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(53, 237, 237, 1),
                                      side: BorderSide(
                                          color:
                                              Color.fromRGBO(53, 237, 237, 1))),
                                  child: Text(
                                    BLBTexts.signIn,
                                    style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black),
                                  ))),
                          const SizedBox(height: BLBSizes.spaceBtwItems),
                        ],
                      ),
                    ),
                  ),

                  //Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Divider(
                          color: dark ? BLBColors.darkGrey : BLBColors.grey,
                          thickness: 0.5,
                          indent: 20,
                          endIndent: 5,
                        ),
                      ),
                      Text("Or Continue With",
                          style: Theme.of(context).textTheme.labelMedium),
                      Flexible(
                        child: Divider(
                          color: dark ? BLBColors.darkGrey : BLBColors.grey,
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 20,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: BLBSizes.spaceBtwItems - 6),

                  //Footer
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

                  //Register Text
                  SizedBox(height: BLBSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("Not a member?"),
                          TextButton(
                              onPressed: () => Get.to(() => SignUpScreen()),
                              child: Text("Register Now"))
                        ],
                      ),
                    ],
                  ),

                  //Skip Button

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Get.offAll(OnboardingScreen()),
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
            ),
          ],
        ),
      ),
    );
  }
}
