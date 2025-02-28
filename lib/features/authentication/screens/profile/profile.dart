import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/features/authentication/screens/profile/profile_menu.dart';
import 'package:blb/features/authentication/screens/settings/blb_circular_images.dart';
import 'package:blb/features/authentication/screens/settings/blb_section_heading.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child:
                
                    Column(
                      children: [
                        const BLBCircularImages(image: BLBImages.user, width: 80, height: 80),
                        TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                        ],  
                      ), 
                    ),       

                    ///Details
                    const SizedBox(height: BLBSizes.spaceBtwItems / 2),
                    const Divider(),
                    const SizedBox(height: BLBSizes.spaceBtwItems),

                    // Heading Profile Info
                    const BLBSectionHeading(title: 'Profile Information', showActionButton: false),
                    const SizedBox(height: BLBSizes.spaceBtwItems),     

                    BLBProfileMenu(title: 'Name', value: 'Coding with BLB', onPressed: () {}),    
                    BLBProfileMenu(title: 'Username', value: 'Coding with BLB', onPressed: () {}),

                    const SizedBox(height: BLBSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: BLBSizes.spaceBtwItems),      

                              // Heading Personal Info     
                    const BLBSectionHeading(title: 'Personal Information', showActionButton: false),
                    const SizedBox(height: BLBSizes.spaceBtwItems),

                    BLBProfileMenu(title: 'User ID', value: '45689', icon: Iconsax.copy, onPressed: () {}),    
                    BLBProfileMenu(title: 'E-mail', value: 'Coding_with_blb', onPressed: () {}),
                    BLBProfileMenu(title: 'Phone Number', value: '+92-317-8059528', onPressed: () {}),    
                    BLBProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                    BLBProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),    
                    const Divider(),
                    const SizedBox(height: BLBSizes.spaceBtwItems),

                    Center(
                      child: TextButton(
                        onPressed: () {}, 
                        child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                        ),
                    )
                 ],    
                ),
             ),
          ),
        );
      }
    }