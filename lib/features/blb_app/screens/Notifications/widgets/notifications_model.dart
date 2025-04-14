//Model class representing item data
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class NotificationsModel {
  //Keep those values final which you do not want to update
  final String id;
  String ownerId;
  String borrowerId;
  

  //Constructor for itemModel
  NotificationsModel(
      {required this.id,
      required this.ownerId,
      required this.borrowerId,
});

  //Static function to create an empty user model
  static NotificationsModel empty() => NotificationsModel(
        id: '',
        ownerId: '',
        borrowerId: '',
      );

  //convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'itemID': id,
      'ownerID': ownerId,
      'borrowerID': borrowerId,
    };
  }

  //used to get an item id from firebase
  NotificationsModel copyWith(
      {String? id,
      String? ownerId,
      String? borrowerId})
       {
    return NotificationsModel(
        id: id ?? this.id, // Use the passed id or keep the existing one  
        ownerId: ownerId ?? this.ownerId,
        borrowerId: borrowerId ?? this.borrowerId);
  }

  //Factory method to create a userModel from a firebase document snapshot
  factory NotificationsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return NotificationsModel(
        id: document.id,
        ownerId: data['ownerID'] ?? '',
        borrowerId: data['borrowerID'] ?? '',
      );
    } else {
      return NotificationsModel.empty();
    }
  }
}
