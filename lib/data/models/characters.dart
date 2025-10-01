class Character {
  /// The id of the character.
  final int id;

  /// The name of the character.
  final String name;

  /// The status of the character ('Alive', 'Dead' or 'unknown').
  final String status;

  /// The species of the character.
  final String species;

  /// The type or subspecies of the character.
  final String type;

  /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
  final String gender;

  /// Name and link to the character's origin location.
  final CharacterLocation origin;

  /// Name and link to the character's last known location endpoint.
  final CharacterLocation location;

  /// Link to the character's image. (300x300px)
  final String image;

  /// List of episodes in which this character appeared.
  final List<String> episode;

  /// Link to the character's own URL endpoint.
  final String url;

  /// Time at which the character was created in the database.
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    // factory is a constructor to convert data coming from json/API to object of type character.
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: CharacterLocation.fromJson(json['origin']),
      location: CharacterLocation.fromJson(json['location']),
      image: json['image'] as String,
      episode: List<String>.from(json['episode'].map((e) => e as String)),
      url: json['url'] as String,
      created: json['created'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // toJson method its used to re-convert data from object to json, used in POST method, or if you want to store data inside database.
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toJson(),
      'location': location.toJson(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }
}

class CharacterLocation {
  /// The name of the location.
  final String name;

  /// Link to the location.
  final String url;

  CharacterLocation({required this.name, required this.url});

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
