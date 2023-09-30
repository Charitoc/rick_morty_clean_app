import 'package:rick_and_morty/features/character_list/domain/entities/location.dart';

class LocationDTO extends Location {
  const LocationDTO({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory LocationDTO.fromJson(Map<String, dynamic> json) => LocationDTO(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
