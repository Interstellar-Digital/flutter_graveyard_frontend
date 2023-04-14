class Deceased {
  final String id;
  final String name;
  final String dateOfBirth;
  final String dateOfDeath;
  final String causeOfDeath;
  final String graveId;

  Deceased({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.causeOfDeath,
    required this.graveId,
  });

  get deceasedID => id;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date_of_birth': dateOfBirth,
      'date_of_death': dateOfDeath,
      'cause_of_death': causeOfDeath,
      'grave_id': graveId,
    };
  }

  static Deceased fromJson(Map<String, dynamic> json) {
    return Deceased(
      id: json['id'],
      name: json['name'],
      dateOfBirth: json['date_of_birth'],
      dateOfDeath: json['date_of_death'],
      causeOfDeath: json['cause_of_death'],
      graveId: json['grave_id'],
    );
  }
}