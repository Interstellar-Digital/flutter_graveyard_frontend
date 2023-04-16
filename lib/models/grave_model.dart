class Grave {
  final String graveID;
  final int plotNumber;
  final String lastBuried;
  final String nextAvailable;
  late final String status;

  Grave({
    required this.graveID,
    required this.plotNumber,
    required this.lastBuried,
    required this.nextAvailable,
  }) {
    final now = DateTime.now();
    final nextAvailableDate = DateTime.tryParse(nextAvailable);
    final lastBuriedDate = DateTime.tryParse(lastBuried);

    if (nextAvailableDate != null && nextAvailableDate.isAfter(now)) {
      status = 'reserved';
    } else if (lastBuriedDate != null &&
        lastBuriedDate.isBefore(now.subtract(Duration(days: 365 * 7)))) {
      status = 'available';
    } else {
      status = 'unknown';
    }
  }

  factory Grave.fromJson(Map<String, dynamic> json) {
    return Grave(
      graveID: json['id'] as String,
      plotNumber: json['plot_num'] as int,
      lastBuried: json['last_buried'] as String,
      nextAvailable: json['next_available'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': graveID,
      'plot_num': plotNumber,
      'last_buried': lastBuried,
      'next_available': nextAvailable,
    };
  }
}