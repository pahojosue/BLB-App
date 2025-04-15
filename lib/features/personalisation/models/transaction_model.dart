import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final String transactionId;
  final String itemId;
  final String borrowerId;
  final String? ownerId;
  final String transactionType;
  final DateTime transactionDate;
  final DateTime? returnDate;
  final double transactionAmount;
  final String? itemImageUrl;

  Transaction({
    required this.transactionId,
    required this.itemId,
    required this.borrowerId,
    this.ownerId,
    required this.transactionType,
    required this.transactionDate,
    this.returnDate,
    required this.transactionAmount,
    this.itemImageUrl,
  });

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'transactionID': transactionId,
      'itemID': itemId,
      'borrowerID': borrowerId,
      'ownerID': ownerId,
      'transactionType': transactionType,
      'transactionDate': transactionDate,
      'returnDate': returnDate,
      'transactionAmount': transactionAmount,
      'itemImageUrl': itemImageUrl,
    };
  }

  // Create model from Firestore document
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      transactionId: map['transactionId'] ?? '',
      itemId: map['itemId'] ?? '',
      borrowerId: map['borrowerId'] ?? '',
      ownerId: map['ownerId'],
      transactionType: map['transactionType'] ?? '',
      transactionDate: (map['transactionDate'] as Timestamp).toDate(),
      returnDate: map['returnDate'] != null 
          ? (map['returnDate'] as Timestamp).toDate() 
          : null,
      transactionAmount: (map['transactionAmount'] ?? 0).toDouble(),
      itemImageUrl: map['itemImageUrl'],
    );
  }
}