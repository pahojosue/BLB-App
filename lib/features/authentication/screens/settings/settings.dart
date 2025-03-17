import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:blb/features/authentication/screens/profile/profile.dart';
import 'package:blb/features/authentication/screens/settings/layouts/blb_settings_menu_tile.dart';
import 'package:blb/features/authentication/screens/settings/layouts/list_tiles/user_profile_tile.dart';
import 'package:blb/features/authentication/screens/settings/blb_section_heading.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
        
           BLBPrimaryHeaderContainer (
            height: 350,
            child: Column(
              children: [
                BLBAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: BLBColors.white))),
                

                ///User Profile Card
                  BLBUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: BLBSizes.spaceBtwSections),

              ],

            ),
           ), 
            
            /// -- Body
            Padding(
              padding: EdgeInsets.all(BLBSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  BLBSectionHeading(title: 'Account Settings'),
                  SizedBox(height: BLBSizes.spaceBtwItems),

                  BlbSettingsMenuTile(icon: Iconsax.safe_home, title: 'Addresses', subtitle: 'Set shopping delivery address', onTap: () {},),
                  BlbSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subtitle: 'Set any kind of notification message', onTap: () {},),
                  BlbSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts', onTap: () {},),


                  /// -- App Settings
                  SizedBox(height: BLBSizes.spaceBtwSections),
                  BLBSectionHeading(title: 'App Settings'),
                  SizedBox(height: BLBSizes.spaceBtwItems),
                  BlbSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase'),
                  BlbSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value){}),
                  ),

                  BlbSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),

                  BlbSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: BLBSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ), 
      ), 
    );
  }
  
  
}