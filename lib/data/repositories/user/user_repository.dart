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
      throw "Somethig went wronf please try again";
    }
  }
}

//Function to fetch user details based on user ID

//Function to update user data in Firestore

//Update any field in specific Users collection
