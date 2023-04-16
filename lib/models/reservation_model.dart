class Reservation {
  final String reservationID;
  final String graveID;
  final String userID;
  final String date;

  Reservation({
    required this.reservationID,
    required this.graveID,
    required this.userID,
    required this.date,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservationID: json['id'],
      graveID: json['grave_id'],
      userID: json['customer_id'],
      date: json['reservation_date'],
    );
  }

  get reservationDate => date;

  Map<String, dynamic> toJson() => {
    'id': reservationID,
    'grave_id': graveID,
    'customer_id': userID,
    'reservation_date': date,
  };
}