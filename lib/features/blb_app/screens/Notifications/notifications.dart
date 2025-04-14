import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/features/blb_app/controllers/notifications/notification_controller.dart';
import 'package:blb/features/blb_app/screens/Notifications/widgets/single_notification.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifController = Get.put(NotificationController());
    notifController.fetchNotifications();

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
              Obx(() {
                if (notifController.isLoading.value) {
                  return Center(
                    child: Text('Loading ...',
                        style: Theme.of(context).textTheme.bodyMedium),
                  );
                }

                if (notifController.notifications.isEmpty) {
                  return Center(
                    child: Text('No data found',
                        style: Theme.of(context).textTheme.bodyMedium),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: notifController.notifications.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return BLBSingleNotification(
                      title: BLBTexts.borrowingRequestTitle,
                      subtitle: notifController.getLenderName(
                          notifController.notifications[index].borrowerId),
                      pressed: notifController.notifications[index].isRead,
                      notificationId: notifController.notifications[index].id,
                      ownerId: notifController.notifications[index].ownerId,
                      borrowerId:
                          notifController.notifications[index].borrowerId,
                      item: notifController.notifications[index].item,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
