import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/data/repositories/user/user_repository.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/features/authentication/screens/profile/re_authenticate_user_login_form.dart';
import 'package:blb/features/personalisation/models/user_model.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/network_manager.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;


  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

@override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await UserRepository.instance.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          address: '',
          profilePicture: userCredentials.user!.photoURL ?? '',
          gender: '',
        );

        // Save user data
        await UserRepository.instance.saveUserRecord(user);
      }
    } catch (e) {
      BLBLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(BLBSizes.md),
       title: 'Delete Account',
       middleText:
        'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed:() async => deleteUserAccount(),
          style: ElevatedButton.styleFrom( 
            backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: BLBSizes.lg), child: Text('Delete')),
            ),
        cancel: OutlinedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        ),
        
    );
  }
  
  /// Delete User Account
  void deleteUserAccount() async{
    try {
      BLBFullScreenLoader.openLoadingDialog('Processing', BLBImages.docerAnimation);

      //First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {

        //RE Verify Auth Email

      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        BLBFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
      } else if (provider == 'password') {
        BLBFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
    }
  }
    } catch (e) {
      BLBFullScreenLoader.stopLoading();
      BLBLoaders.warningSnackBar(
        title: 'Error',
        message: e.toString());
    }
  }

  /// Re-Authenticate before deleting 
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {

        BLBFullScreenLoader.openLoadingDialog('Processing', BLBImages.docerAnimation);
        //Check Internet Connectivity
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          BLBFullScreenLoader.stopLoading();
          return;
        }
        if (!reAuthFormKey.currentState!.validate()) {
          BLBFullScreenLoader.stopLoading();
          return;
        }

        await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
          await AuthenticationRepository.instance.deleteAccount();
          BLBFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
    } catch (e) {
      BLBFullScreenLoader.stopLoading();
      BLBLoaders.warningSnackBar(
        title: 'Error',
        message: e.toString());
  }
  }
}
