import 'package:blb/data/repositories/user/user_repository.dart';
import 'package:blb/features/blb_app/screens/profile/profile.dart';
import 'package:blb/features/personalisation/controllers/user_controller.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/helpers/network_manager.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Controller to manage user-related functionality.

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final UserRepository userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      BLBFullScreenLoader.openLoadingDialog(
          'We are updating your information...', BLBImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BLBFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        BLBFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      BLBFullScreenLoader.stopLoading();

      // Show success message
      BLBLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your name has been updated successfully.');

      /// Move to Previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      BLBFullScreenLoader.stopLoading();

      // Show error message
      BLBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      // Stop loading
      BLBFullScreenLoader.stopLoading();
    }
  }
}
