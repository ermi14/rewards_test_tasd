import 'package:task_rewards/data/models/transaction.dart';

class Reward {
  String cardNumber;
  String cardExpirationDate;
  double balance;
  List<Transaction> transactions;

  Reward({
    required this.cardNumber,
    required this.cardExpirationDate,
    required this.balance,
    required this.transactions,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
    cardNumber: json["cardNumber"],
    cardExpirationDate: json["cardExpirationDate"],
    balance: json["balance"]?.toDouble(),
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cardNumber": cardNumber,
    "cardExpirationDate": cardExpirationDate,
    "balance": balance,
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}