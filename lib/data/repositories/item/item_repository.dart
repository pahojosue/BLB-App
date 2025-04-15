//Repository class for item-related operations
import 'dart:convert';
import 'dart:io';

import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/exceptions/firebase_exceptions.dart';
import 'package:blb/utils/exceptions/format_exceptions.dart';
import 'package:blb/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemRepository extends GetxController {
  static ItemRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to Firestore
  Future<void> saveUserRecord(ItemModel item) async {
    try {
      // If the item id is empty, let Firestore generate a new document ID
      if (item.id.isEmpty) {
        // Add the item document and get the generated ID
        final docRef = await _db.collection("Items").add(item.toJson());

        // Now update the item with the generated ID
        final updatedItem = item.copyWith(id: docRef.id);

        // Update the item document with the generated ID
        await _db.collection("Items").doc(docRef.id).set(updatedItem.toJson());
      } else {
        // If the item already has an ID, just update or save it with the provided ID
        await _db.collection("Items").doc(item.id).set(item.toJson());
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

  //Upload Image to Imgur
  Future<String> uploadImage(File image) async {
    try {
      final clientId = '55ac9c365583b0b';
      final url = Uri.parse('https://api.imgur.com/3/upload');

      final request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Client-ID $clientId'
        ..files.add(await http.MultipartFile.fromPath('image', image.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);

        //Parse the response to obtain the image URL
        final data = json.decode(responseString);
        //save the image url
        String imageURL = data['data']['link'];
        return imageURL;
      } else {
        return '';
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

  //Get the Items from Firebase
  Future<List<ItemModel>> getItems() async {
    try {
      final snapshot = await _db
          .collection('Items')
          .where('borrowerID', isEqualTo: "")
          .get();
      return snapshot.docs.map((e) => ItemModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Get Items based on the Query
  Future<List<ItemModel>> getFavouriteItems(List<String> itemIds) async {
    try {
      final snapshot = await _db
          .collection('Items')
          .where(FieldPath.documentId,whereIn: itemIds).get();
      return snapshot.docs.map((querySnapshot) => ItemModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Get Items depending on searched Item
  Future<List<ItemModel>> getSearchedItems(String query) async {
    try {
      final queryLowercase = query.toLowerCase();

      final snapshot = await _db
          .collection('Items')
          .where('nameLowercase', isGreaterThanOrEqualTo: queryLowercase)
          .where('nameLowercase',
              isLessThanOrEqualTo: queryLowercase + '\uf8ff')
          .get();
      return snapshot.docs.map((e) => ItemModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw BLBFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BLBPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Update a field of an Item depending on it's ID.
  Future<void> updateSingleField(Map<String, dynamic> json, String id) async {
    try {
      await _db.collection("Items").doc(id).update(json);
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
