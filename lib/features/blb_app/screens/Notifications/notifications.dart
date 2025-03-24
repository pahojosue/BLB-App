import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/features/blb_app/screens/Notifications/widgets/single_notification.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BLBAppBar(
          showBackArrow: true,
          title: Text("Notifications",
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),
          child: Column(
            children: [
              BLBSingleNotification(
                  title: BLBTexts.borrowingRequestTitle,
                  subtitle: BLBTexts.borrowingRequestSubtitle("Rania"),
                  pressed: false),
              BLBSingleNotification(
                  title: BLBTexts.borrowingRequestTitle,
                  subtitle: BLBTexts.borrowingRequestSubtitle("Paho"),
                  pressed: true),
              BLBSingleNotification(
                  title: BLBTexts.borrowingRequestTitle,
                  subtitle: BLBTexts.borrowingRequestSubtitle("Paul"),
                  pressed: false),
            ],
          ),
        ),
      ),
    );
  }
}
