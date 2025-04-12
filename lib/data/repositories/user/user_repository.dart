import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/features/personalisation/models/user_model.dart';
import 'package:blb/utils/exceptions/firebase_exceptions.dart';
import 'package:blb/utils/exceptions/format_exceptions.dart';
import 'package:blb/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BLBFormatException();
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw "Somethig went wrong please try again";
    }
  }


//Function to fetch user details based on user ID
Future<UserModel> fetchUserDetails() async {
  try {
    final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
    if (documentSnapshot.exists) {
      return UserModel.fromSnapshot(documentSnapshot);
    } else {
      return UserModel.empty(); // User not found
    }
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

//Function to update user data in Firestore
Future<void> updateUserDetails(UserModel updatedUser) async {
  try {
    await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
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

//Update any field in specific Users collection
Future<void> updateSingleField(Map<String, dynamic> json) async {
  try {
    await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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

/// Function to delete user data from Firestore
Future<void> removeUserRecord(String userId) async {
  try {
    await _db.collection("Users").doc(userId).delete();
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

} 