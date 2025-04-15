// controllers/transaction_controller.dart

import 'package:blb/data/repositories/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionController {
  final TransactionRepository _transactionRepository;

  TransactionController(this._transactionRepository);

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