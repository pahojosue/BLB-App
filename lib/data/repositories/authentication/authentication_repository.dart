import 'package:blb/data/repositories/user/user_repository.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:blb/navigation_menu.dart';
import 'package:blb/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:blb/utils/exceptions/firebase_exceptions.dart';
import 'package:blb/utils/exceptions/format_exceptions.dart';
import 'package:blb/utils/exceptions/platform_exceptions.dart';
import 'package:blb/utils/local_storage/storage_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:blb/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User
  User? get authUser => _auth.currentUser;

  //Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  @override
  void onInit() {
    deviceStorage.write("REMEMBER_ME_EMAIL", "");
    deviceStorage.write("REMEMBER_ME_PASSWORD", "");
    super.onInit();
  }

  //Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {

        // Initialize User Specific Storage
        await BLBLocalStorage.init(user.uid);

        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //Local Storage

      if (kDebugMode) {
        print("================= GeT STORAGE Auth Repo ================");
        print(deviceStorage.read('IsFirstTime'));
      }

      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.write('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  /* -------------------------Email and password sign-in ---------------------*/
  //[Email Authentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //[Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //[Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //[ReAuthentication] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      /// Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      /// Reauthenticate the user
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //[EmailAuthentication] - FORGOT PASSWORD

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /* --------------------- Federated Identity and social sign-in ---------------------*/
  //[GoogleAuthentication] - Google

   // Future<UserCredential?> signInWithGoogle() async {
    // try {
    // Trigger the authentication flow
   // final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
   // final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

    // Create a new credential
      // final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

       // Once signed in, return the UserCredential
      // return await _auth.signInWithCredential(credentials);

    // } on FirebaseAuthException catch (e) {
      // throw BLBFirebaseAuthException(e.code).message;
    // } on FirebaseException catch (e) {
   //   throw BLBFirebaseAuthException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const BLBFormatException();
    // } on PlatformException catch (e) {
     //  throw BLBPlatformException(e.code).message;
    // } catch (e) {
    //  if (kDebugMode) print('Something went wrong: $e');
     //  return null;
     // }
   // }

  //[FacebookAuthentication] - Facebook

  /* --------------------- ./end Federated identity & social sign-in -----------------*/

  //[LogoutUser] - Valid for any Authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //[DeleteUser] - Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BLBFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
