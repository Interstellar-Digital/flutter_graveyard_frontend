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
      graveyardID: json['id'],
      name: json['name'],
      location: json['location'],
      numberOfPlots: json['max_plots'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': graveyardID,
      'name': name,
      'location': location,
      'max_plots': numberOfPlots

, };
}
}