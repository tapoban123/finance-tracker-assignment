enum TransactionType {
  income(type: "income"),
  expense(type: "expense");

  final String type;
  const TransactionType({required this.type});
}
