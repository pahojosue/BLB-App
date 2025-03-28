import 'package:blb/common/styles/spacing_styles.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/screens/login/widgets/login_form.dart';
import 'package:blb/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:blb/features/authentication/screens/signup/signup.dart';
import 'package:blb/navigation_menu.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  const BLBLoginForm(),

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
                      BLBSocialButtons(),
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
            ),
          ],
        ),
      ),
    );
  }
}
