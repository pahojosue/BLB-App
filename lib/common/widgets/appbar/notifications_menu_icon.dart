import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';

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
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.notification, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: BLBColors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 1)),
            child: Center(
              child: Text("2",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: BLBColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}
