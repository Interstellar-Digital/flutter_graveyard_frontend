class Grave {
  final String graveID;
  final int plotNumber;
  final String lastBuried;
  final String nextAvailable;

  Grave({
    required this.graveID,
    required this.plotNumber,
    required this.lastBuried,
    required this.nextAvailable,
  });

  factory Grave.fromJson(Map<String, dynamic> json) {
    return Grave(
      graveID: json['graveID'] as String,
      plotNumber: json['plotNumber'] as int,
      lastBuried: json['lastBuried'] as String,
      nextAvailable: json['nextAvailable'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'graveID': graveID,
      'plotNumber': plotNumber,
      'lastBuried': lastBuried,
      'nextAvailable': nextAvailable,
    };
  }
}