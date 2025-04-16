import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BLBNotificationsCounterIcon extends StatelessWidget {
  const BLBNotificationsCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.notification, color: iconColor));
  }
}
