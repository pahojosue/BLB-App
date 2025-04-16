import 'package:blb/features/blb_app/screens/profile/profile.dart';
import 'package:blb/features/blb_app/screens/settings/blb_circular_images.dart';
import 'package:blb/features/personalisation/controllers/user_controller.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BLBUserProfileTile extends StatelessWidget {
  const BLBUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : BLBImages.user;
        return BLBCircularImages(
          image: image,
          width: 50,
          height: 50,
          isNetworkImage: networkImage.isNotEmpty,
        );
      }),
      title: Text(controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: BLBColors.white)),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: BLBColors.white)),
      trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: const Icon(Iconsax.edit, color: BLBColors.white)),
    );
  }
}
