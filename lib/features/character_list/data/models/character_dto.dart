import 'package:rick_and_morty/features/character_list/data/models/location_dto.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';

class CharacterDTO extends Character {
  const CharacterDTO({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required LocationDTO origin,
    required LocationDTO location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          image: image,
        );

  factory CharacterDTO.fromJson(Map<String, dynamic> json) => CharacterDTO(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: LocationDTO.fromJson(json["origin"]),
        location: LocationDTO.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        // "gender": gender,
        // "origin": origin.toJson(),
        // "location": location.toJson(),
        "image": image,
        // "episode": List<dynamic>.from(episode.map((x) => x)),
        // "url": url,
        // "created": created.toIso8601String(),
    };
}
