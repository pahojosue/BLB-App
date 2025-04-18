import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/helpers/network_manager.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  googleSignIn() {}

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL");
    password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading
      BLBFullScreenLoader.openLoadingDialog(
          "Logging you in...", BLBImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BLBFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        BLBFullScreenLoader.stopLoading();
        return;
      }

      //Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //Login user using Email & Password Authentication
      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      BLBFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      BLBFullScreenLoader.stopLoading();
      BLBLoaders.errorSnackBar(title: "Oups", message: e.toString());
    }
  }
}

/// -- Google SignIn Authentication

Future<void> googleSignIn() async {
  try {
    // Start Loading
    BLBFullScreenLoader.openLoadingDialog(
        'Logging you in...', BLBImages.docerAnimation);

    //Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      BLBFullScreenLoader.stopLoading();
      return;
    }

    // Google Authentication
    // final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

    // Save User Record
    // await UserController.instance.saveUserRecord(userCredentials);

    // Remove Loader
    BLBFullScreenLoader.stopLoading();

    // Redirect
    AuthenticationRepository.instance.screenRedirect();
  } catch (e) {
    BLBFullScreenLoader.stopLoading();
    BLBLoaders.errorSnackBar(title: 'Oups!', message: e.toString());
  }
}
