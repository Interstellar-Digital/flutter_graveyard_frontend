class BillingInformation {
  final String billingID;
  final String userID;
  final double amount;
  final String date;
  final String billingAddress;
  final String creditCardNumber;
  final String expirationDate;

  BillingInformation({
    required this.billingID,
    required this.userID,
    required this.amount,
    required this.date,
    required this.billingAddress,
    required this.creditCardNumber,
    required this.expirationDate,
  });
}
