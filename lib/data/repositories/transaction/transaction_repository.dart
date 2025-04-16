// repositories/transaction_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';



class TransactionRepository {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Reference to the transactions collection
  CollectionReference get _transactions => FirebaseFirestore.instance.collection('transactions');

  // Add a new transaction
  //Future<void> addTransaction(Transaction transaction) async {
  //  await _transactions.doc(transaction.transactionId).set(transaction.toMap());
  //}

  // Get all transactions for a specific borrower
  //Stream<List<Transaction>> getTransactionsByBorrower(String borrowerId) {
    //return _transactions
     //   .where('borrowerID', isEqualTo: borrowerId)
     //   .snapshots()
       // .map((snapshot) {
    //  return snapshot.docs
         // .map((doc) => Transaction.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        //  .toList();
 //   });
  //}

  // Get a single transaction by ID
  Future<Transaction?> getTransactionById(String transactionId) async {
    final doc = await _transactions.doc(transactionId).get();
    if (doc.exists && doc.data() != null) {
    //  return Transaction.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }
    return null;
  }

  // Update a transaction
  Future<void> updateTransaction(Transaction transaction) async {
   // await _transactions.doc(transaction.transactionId).update(transaction.toMap());
  }

  // Delete a transaction
  Future<void> deleteTransaction(String transactionId) async {
    await _transactions.doc(transactionId).delete();
  }
}

extension on Transaction {
  String? get transactionId => null;
}

