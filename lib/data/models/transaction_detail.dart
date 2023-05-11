class TransactionDetail {
  String id;
  String title;
  DateTime date;
  double amount;
  bool bird;
  String status;

  TransactionDetail({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.bird,
    required this.status,
  });

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      TransactionDetail(
        id: json["id"],
        title: json["title"],
        date: DateTime.parse(json["date"]),
        amount: json["amount"]?.toDouble(),
        bird: json["bird"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "bird": bird,
        "status": status,
      };
}
