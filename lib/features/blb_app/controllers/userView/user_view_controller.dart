import 'package:blb/data/repositories/item/item_repository.dart';
import 'package:blb/data/repositories/notifications/notification_repository.dart';
import 'package:blb/data/repositories/user/user_repository.dart';
import 'package:blb/features/personalisation/models/user_model.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UserViewController extends GetxController {
  static UserViewController get instance => Get.find();

  final itemRepository = Get.put(ItemRepository());
  final userRepository = UserRepository.instance;
  final notificationRepository = Get.put(NotificationRepository());

  Future<String> getBorrowerName(String id) async {
    UserModel user = await userRepository.fetchLenderDetails(id);
    return user.fullName;
  }

  Future<String> getBorrowerAddress(String id) async {
    UserModel user = await userRepository.fetchLenderDetails(id);
    return user.address;
  }

  Future<void> updateBorrowerId(String itemId, String borrowerId) async {
    try {
      BLBFullScreenLoader.openLoadingDialog(
          "We are lending your Item", BLBImages.docerAnimation);

      Map<String, dynamic> borrow = {'borrowerID': borrowerId};
      itemRepository.updateSingleField(borrow, itemId);

      BLBFullScreenLoader.stopLoading();
      BLBLoaders.successSnackBar(
          title: "Congratulations",
          message: "You have successfuly lent your Item");
    } catch (e) {
      BLBLoaders.errorSnackBar(title: "Error Borrowing", message: e.toString());
    }
  }
}
