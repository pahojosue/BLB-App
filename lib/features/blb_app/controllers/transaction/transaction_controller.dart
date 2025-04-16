// controllers/transaction_controller.dart

import 'package:blb/data/repositories/transaction/transaction_repository.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TransactionController {
  static TransactionController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final transactionRepository = Get.put(TransactionRepository());

  RxList<ItemModel> items = <ItemModel>[].obs;
  final isLoading = false.obs;

  // Add a new transaction
  Future<void> addTransaction(Transaction transaction) async {
    // await _transactionRepository.addTransaction(transaction);
  }

  // Get all transactions for the current user (as borrower)
  //Stream<List<Transaction>> getUserTransactions(String currentUserId) {
  // return _transactionRepository.getTransactionsByBorrower(currentUserId);
}

// Get transaction details
Future<Transaction?> getTransactionDetails(String transactionId) async {
  // return await _transactionRepository.getTransactionById(transactionId);
}

// Update a transaction
Future<void> updateTransaction(Transaction transaction) async {
  // await _transactionRepository.updateTransaction(transaction);
}

// Delete a transaction
Future<void> deleteTransaction(String transactionId) async {
  // await _transactionRepository.deleteTransaction(transactionId);
}
//}
