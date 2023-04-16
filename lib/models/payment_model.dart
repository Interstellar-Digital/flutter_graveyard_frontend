class Payment {
  String? id;
  String customerId;
  String userId;
  double amount;
  String dateCreated;

  Payment({
    this.id,
    required this.customerId,
    required this.userId,
    required this.amount,
    required this.dateCreated,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      customerId: json['customer_id'],
      userId: json['user_id'],
      amount: double.parse(json['amount'].toString()),
      dateCreated: json['date_created'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = customerId;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['date_created'] = dateCreated;
    if (this.id != null) {
      data['id'] = id;
    }
    return data;
  }
}