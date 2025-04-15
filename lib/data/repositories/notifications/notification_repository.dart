//Repository class for item-related operations
import 'package:blb/features/personalisation/models/notifications_model.dart';
import 'package:blb/utils/exceptions/firebase_exceptions.dart';
import 'package:blb/utils/exceptions/format_exceptions.dart';
import 'package:blb/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NotificationRepository extends GetxController {
  static NotificationRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to Firestore
  Future<void> saveUserRecord(NotificationsModel notification) async {
    try {
      // If the item id is empty, let Firestore generate a new document ID
      if (notification.id.isEmpty) {
        // Add the item document and get the generated ID
        final docRef =
            await _db.collection("Notifications").add(notification.toJson());

        // Now update the item with the generated ID
        final updatedItem = notification.copyWith(id: docRef.id);

        // Update the item document with the generated ID
        await _db
            .collection("Notifications")
            .doc(docRef.id)
            .set(updatedItem.toJson());
      } else {
        // If the item already has an ID, just update or save it with the provided ID
        await _db
            .collection("Notifications")
            .doc(notification.id)
            .set(notification.toJson());
      }
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

  //Get the Notifications from Firebase
  Future<List<NotificationsModel>> getNotifications(String id) async {
    try {
      final snapshot = await _db
          .collection('Notifications')
          .where('ownerID', isEqualTo: id)
          .get();
      return snapshot.docs
          .map((e) => NotificationsModel.fromSnapshot(e))
          .toList();
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Update any field in specific Notifications collection
  Future<void> updateSingleField(Map<String, dynamic> json, String id) async {
    try {
      await _db.collection("Notifications").doc(id).update(json);
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
