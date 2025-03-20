// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  final String uid;
  final String transactionId;
  final String title;
  final double amount;
  final String transactionType;
  final String category;
  final int date;

  TransactionModel({
    required this.uid,
    required this.transactionId,
    required this.title,
    required this.amount,
    required this.transactionType,
    required this.category,
    required this.date,
  });

  TransactionModel copyWith({
    String? uid,
    String? transactionId,
    String? title,
    double? amount,
    String? transactionType,
    String? category,
    int? date,
  }) {
    return TransactionModel(
      uid: uid ?? this.uid,
      transactionId: transactionId ?? this.transactionId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      transactionType: transactionType ?? this.transactionType,
      category: category ?? this.category,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'transactionId': transactionId,
      'title': title,
      'amount': amount,
      'transactionType': transactionType,
      'category': category,
      'date': date,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      uid: map['uid'] as String,
      transactionId: map['transactionId'] as String,
      title: map['title'] as String,
      amount: map['amount'] as double,
      transactionType: map['transactionType'] as String,
      category: map['category'] as String,
      date: map['date'] as int,
    );
  }
}
