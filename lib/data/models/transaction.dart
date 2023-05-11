import 'dart:convert';

class Transaction {
  String id;
  String title;
  DateTime date;
  double amount;
  bool bird;

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.bird,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    title: json["title"],
    date: DateTime.parse(json["date"]),
    amount: json["amount"]?.toDouble(),
    bird: json["bird"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "bird": bird,
  };
}

List<Transaction> transactionsFromJson(String str) => List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionsToJson(List<Transaction> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
