import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/features/authentication/screens/profile/change_name.dart';
import 'package:blb/features/authentication/screens/profile/profile_menu.dart';
import 'package:blb/features/authentication/screens/settings/blb_circular_images.dart';
import 'package:blb/features/authentication/screens/settings/blb_section_heading.dart';
import 'package:blb/features/personalisation/controllers/user_controller.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: BLBAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),
          child: Column(
            children: [
              //profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : BLBImages.user;
                      return BLBCircularImages(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: BLBSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: BLBSizes.spaceBtwItems),

              // Heading Profile Info
              const BLBSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: BLBSizes.spaceBtwItems),

              BLBProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              BLBProfileMenu(
                  title: 'Username',
                  value: controller.user.value.userName,
                  onPressed: () {}),

              const SizedBox(height: BLBSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: BLBSizes.spaceBtwItems),

              // Heading Personal Info
              const BLBSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: BLBSizes.spaceBtwItems),

              BLBProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {}),
              BLBProfileMenu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onPressed: () {}),
              BLBProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              BLBProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              BLBProfileMenu(
                  title: 'Date of Birth',
                  value: '10 Oct, 1994',
                  onPressed: () {}),
              const Divider(),
              const SizedBox(height: BLBSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
