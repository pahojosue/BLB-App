import 'package:blb/features/authentication/screens/profile/profile.dart';
import 'package:blb/features/authentication/screens/settings/blb_circular_images.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';



class BLBUserProfileTile extends StatelessWidget {
  const BLBUserProfileTile({
    super.key, required this.onPressed,
  });

final VoidCallback onPressed;
@override
Widget build(BuildContext context) {
    return ListTile(
      leading: const BLBCircularImages(image: BLBImages.user, width: 50, height: 50, padding: 0),
      
      title: Text('Coding with BLB', style: Theme.of(context).textTheme.headlineSmall!.apply(color: BLBColors.white)),
      subtitle: Text('support@codingwithBLB.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: BLBColors.white)),
      trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen()), icon: const Icon(Iconsax.edit, color: BLBColors.white)),
    );
  }
}