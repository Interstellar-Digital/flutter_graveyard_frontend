



class Deceased {
  final String deceasedID;
  final String name;
  final String dateOfDeath;
  final String causeOfDeath;
  final String plotID;

  Deceased({
    required this.deceasedID,
    required this.name,
    required this.dateOfDeath,
    required this.causeOfDeath,
    required this.plotID,
  });
}

class Reservation {
  final String reservationID;
  final String plotID;
  final String userID;
  final String date;

  Reservation({
    required this.reservationID,
    required this.plotID,
    required this.userID,
    required this.date,
  });
}

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
