class Graveyard {
  final String graveyardID;
  final String name;
  final String location;
  final int numberOfPlots;

  Graveyard({
    required this.graveyardID,
    required this.name,
    required this.location,
    required this.numberOfPlots,
  });

  factory Graveyard.fromJson(Map<String, dynamic> json) {
    return Graveyard(
      graveyardID: json['graveyardID'],
      name: json['name'],
      location: json['location'],
      numberOfPlots: json['numberOfPlots'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'graveyardID': graveyardID,
      'name': name,
      'location': location,
      'numberOfPlots': numberOfPlots

, };
}
}