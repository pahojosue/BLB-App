//Model class representing item data
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  //Keep those values final which you do not want to update
  final String id;
  final String name;
  String description;
  final String imageUrl;
  final String price;
  String state;
  String lendingPeriod;
  String ownerId;
  String borrowerId;
  String category;
  final bool canBeBartered;

  //Constructor for itemModel
  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.state,
    required this.lendingPeriod,
    required this.ownerId,
    required this.borrowerId,
    required this.category,
    required this.canBeBartered,
  });

  //Static function to create an empty user model
  static ItemModel empty() => ItemModel(
        id: '',
        name: '',
        description: '',
        imageUrl: '',
        price: '',
        state: '',
        lendingPeriod: '',
        ownerId: '',
        borrowerId: '',
        category: '',
        canBeBartered: false,
      );

  //convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'itemID': id,
      'itemName': name,
      'itemDescription': description,
      'imageURL': imageUrl,
      'itemPrice': price,
      'itemState': state,
      'lendingPeriod': lendingPeriod,
      'ownerID': ownerId,
      'borrowerID': borrowerId,
      'itemCategory': category,
      'canBeBartered': canBeBartered
    };
  }

  //used to get an item id from firebase
  ItemModel copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? price,
    String? state,
    String? lendingPeriod,
    String? ownerId,
    String? borrowerId,
    String? category,
    bool? canBeBartered,
  }) {
    return ItemModel(
      id: id ?? this.id, // Use the passed id or keep the existing one
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      state: state ?? this.state,
      lendingPeriod: lendingPeriod ?? this.lendingPeriod,
      ownerId: ownerId ?? this.ownerId,
      borrowerId: borrowerId ?? this.borrowerId,
      category: category ?? this.category,
      canBeBartered: canBeBartered ?? this.canBeBartered,
    );
  }

  //Factory method to create a userModel from a firebase document snapshot
  factory ItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ItemModel(
        id: document.id,
        name: data['itemName'] ?? '',
        description: data['itemDescription'] ?? '',
        imageUrl: data['imageURL'] ?? '',
        price: data['itemPrice'] ?? '',
        state: data['itemState'] ?? '',
        lendingPeriod: data['lendingPeriod'] ?? '',
        ownerId: data['ownerID'] ?? '',
        borrowerId: data['borrowerID'] ?? '',
        category: data['itemCategory'] ?? '',
        canBeBartered: data['canBeBartered'] ?? false,
      );
    } else {
      return ItemModel.empty();
    }
  }
}
