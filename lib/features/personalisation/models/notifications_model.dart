//Model class representing item data
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  //Keep those values final which you do not want to update
  final String id;
  String ownerId;
  String borrowerId;
  bool isRead;
  final ItemModel item;

  //Constructor for itemModel
  NotificationsModel({
    required this.id,
    required this.ownerId,
    required this.borrowerId,
    required this.item,
    required this.isRead,
  });

  //Static function to create an empty user model
  static NotificationsModel empty() => NotificationsModel(
        id: '',
        ownerId: '',
        borrowerId: '',
        item: ItemModel.empty(),
        isRead: false,
      );

  //convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'itemID': id,
      'ownerID': ownerId,
      'borrowerID': borrowerId,
      'itemModel': item.toJson(),
      'isRead': isRead,
    };
  }

  //used to get an item id from firebase
  NotificationsModel copyWith(
      {String? id,
      String? ownerId,
      String? borrowerId,
      ItemModel? item,
      bool? isRead}) {
    return NotificationsModel(
      id: id ?? this.id, // Use the passed id or keep the existing one
      ownerId: ownerId ?? this.ownerId,
      borrowerId: borrowerId ?? this.borrowerId,
      item: item ?? this.item,
      isRead: isRead ?? false,
    );
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
        item: ItemModel.fromJson(data['itemModel']),
        isRead: data['isRead'],
      );
    } else {
      return NotificationsModel.empty();
    }
  }
}
