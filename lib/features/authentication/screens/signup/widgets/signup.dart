import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:blb/navigation_menu.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                  Form(
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
                                decoration: const InputDecoration(
                                    labelText: BLBTexts.firstName),
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
                                decoration: const InputDecoration(
                                    labelText: BLBTexts.lastName),
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
                                decoration: const InputDecoration(
                                    labelText: BLBTexts.username),
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
                                decoration: const InputDecoration(
                                    labelText: BLBTexts.email),
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
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: BLBTexts.password),
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
                                decoration: const InputDecoration(
                                    labelText: BLBTexts.phoneNo),
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
                                decoration:
                                    const InputDecoration(labelText: "Address"),
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
                              child:
                                  Checkbox(value: true, onChanged: (value) {}),
                            ),
                            const SizedBox(width: BLBSizes.spaceBtwItems),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: '${BLBTexts.iAgreeTo} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: BLBTexts.privacyPolicy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? BLBColors.white
                                            : BLBColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? BLBColors.white
                                            : BLBColors.primary,
                                      )),
                              TextSpan(
                                  text: ' ${BLBTexts.and} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: BLBTexts.termsOfUse,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? BLBColors.white
                                            : BLBColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? BLBColors.white
                                            : BLBColors.primary,
                                      )),
                            ]))
                          ],
                        ),

                        const SizedBox(height: BLBSizes.spaceBtwSections - 12),

                        ///Sign Up Button
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () =>
                                    Get.to(() => const VerifyEmailScreen()),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(53, 237, 237, 1),
                                    side: BorderSide(
                                        color:
                                            Color.fromRGBO(53, 237, 237, 1))),
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                      ],
                    ),
                  ),

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
