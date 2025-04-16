import 'package:blb/data/repositories/item/item_repository.dart';
import 'package:blb/data/repositories/notifications/notification_repository.dart';
import 'package:blb/data/repositories/user/user_repository.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/features/personalisation/models/notifications_model.dart';
import 'package:blb/features/personalisation/models/user_model.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/helpers/network_manager.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  //Variables
  final isRead = true.obs;
  RxList<NotificationsModel> notifications = <NotificationsModel>[].obs;
  final isLoading = false.obs;
  final itemRepository = Get.put(ItemRepository());
  final userRepository = UserRepository.instance;
  final notificationRepository = Get.put(NotificationRepository());

  void fetchNotifications() async {
    try {
      //Show loader while loading the items
      isLoading.value = true;

      //Fetch items
      final notificationsFetched =
          await notificationRepository.getNotifications(_auth.currentUser!.uid);

      //Assign Items
      notifications.assignAll(notificationsFetched);
    } catch (e) {
      BLBLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //Send Item Details
  Future<void> sendBorrowingNotificationDetails(
      String ownerId, ItemModel item) async {
    try {
      //Start Loading
      BLBFullScreenLoader.openLoadingDialog(
          "We are processing your information...", BLBImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BLBFullScreenLoader.stopLoading();
        return;
      }

      final user = _auth.currentUser;
      //Save the Item details in the firebase
      final newItem = NotificationsModel(
        id: '',
        ownerId: ownerId,
        borrowerId: user!.uid,
        item: item,
        isRead: false,
      );

      await notificationRepository.saveUserRecord(newItem);

      //Remove Loader
      BLBFullScreenLoader.stopLoading();

      //Show success Message
      BLBLoaders.successSnackBar(
          title: "Congratulations",
          message: "The borrowing request has been successfully sent");

      //Move to Lending Page
    } catch (e) {
      // Catch any error and show it
      BLBFullScreenLoader.stopLoading();
      BLBLoaders.errorSnackBar(
        title: "Oops!",
        message: "Something went wrong: ${e.toString()}",
      );
    }
  }

  Future<String> getLenderName(String id) async {
    UserModel user = await userRepository.fetchLenderDetails(id);
    return user.userName;
  }

  Future<void> updateIsRead(String documentId) async {
    Map<String, dynamic> isRead = {'isRead': true};
    notificationRepository.updateSingleField(isRead, documentId);
  }
}
