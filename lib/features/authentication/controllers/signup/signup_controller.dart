import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/data/repositories/user/user_repository.dart';
import 'package:blb/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:blb/features/personalisation/models/user_model.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/helpers/network_manager.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final gender = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //--SIGNUP
  Future<void> signup() async {
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

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        BLBFullScreenLoader.stopLoading();
        return;
      }

      //Privacy policy Check
      if (!privacyPolicy.value) {
        BLBLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you have to read and accept the Privacy Policy & Terms of Use",
        );
        return;
      }

      //Register user in the Firebase Authentication & Save the user data in Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        address: address.text.trim(),
        profilePicture: '',
        gender: gender.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      BLBFullScreenLoader.stopLoading();

      //Show success Message
      BLBLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! verify email to continue");

      //Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //Remove loader
      BLBFullScreenLoader.stopLoading();
      //Show some generic error to the user
      BLBLoaders.errorSnackBar(title: "Oops!", message: e.toString());
    }
  }
}
