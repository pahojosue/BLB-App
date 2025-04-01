import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/helpers/network_manager.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  //Send reset password email
  sendPasswordResetEmail() async {
    try {
      //Start Loading
      BLBFullScreenLoader.openLoadingDialog(
          'Processing your request...', BLBImages.docerAnimation);

          //Check Internet Connectivity
       final isConnected = await NetworkManager.instance.isConnected();
       if (!isConnected) {BLBFullScreenLoader.stopLoading(); return;}
       
       //Form Validation
        if (!forgotPasswordFormKey.currentState!.validate()) {
          BLBFullScreenLoader.stopLoading();
          return;
        }

      //Send password reset email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      BLBFullScreenLoader.stopLoading();

      //Show Success Screen
      BLBLoaders.successSnackBar(title: 'Email Sent',
          message: 'Email Link Sent to Reset your password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      //Remove Loader
      BLBFullScreenLoader.stopLoading();
      BLBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    
    try {
      //Start Loading
      BLBFullScreenLoader.openLoadingDialog(
          'Processing your request...', BLBImages.docerAnimation);

          //Check Internet Connectivity
       final isConnected = await NetworkManager.instance.isConnected();
       if (!isConnected) {BLBFullScreenLoader.stopLoading(); return;}
       

      //Send password reset email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      //Remove Loader
      BLBFullScreenLoader.stopLoading();

      //Show Success Screen
      BLBLoaders.successSnackBar(title: 'Email Sent',
          message: 'Email Link Sent to Reset your password'.tr);

    } catch (e) {
      //Remove Loader
      BLBFullScreenLoader.stopLoading();
      BLBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  

  }
}