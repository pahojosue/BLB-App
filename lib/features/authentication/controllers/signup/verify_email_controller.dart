import 'dart:async';

import 'package:blb/common/widgets/success_screen/success_screen1.dart';
import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

/// Send Email Verification Link
sendEmailVerification() async {
  try{
    await AuthenticationRepository.instance.sendEmailVerification();
    BLBLoaders.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email.');

  }catch(e){
    BLBLoaders.errorSnackBar(title: 'Oups!', message: e.toString());
  }
}

/// Timer to automatically redirect on Email Verification
setTimerForAutoRedirect(){
  Timer.periodic(const Duration(seconds: 1), 
  (timer) async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user?.emailVerified ?? false) {
      timer.cancel();
      Get.off(
        () => SuccessScreen(
          image: BLBImages.staticSuccessIllustration, 
          title: BLBTexts.yourAccountCreatedTitle, 
          subTitle: BLBTexts.yourAccountCreatedSubTitle, 
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
   },
   );
}
///Manually Check if Email Verified 
checkEmailVerificationStatus() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if(currentUser != null && currentUser.emailVerified) {
    Get.off(
        () => SuccessScreen(
          image: BLBImages.staticSuccessIllustration, 
          title: BLBTexts.yourAccountCreatedTitle, 
          subTitle: BLBTexts.yourAccountCreatedSubTitle, 
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
  }
}
}