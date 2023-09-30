// To parse this JSON data, do
//
//     final allCharacters = allCharactersFromJson(jsonString);

import 'dart:convert';

import 'package:rick_and_morty/features/character_list/data/models/character_dto.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/all_characters.dart';

AllCharacters allCharactersFromJson(String str) =>
    AllCharactersDTO.fromJson(json.decode(str));

// String allCharactersToJson(AllCharactersDTO data) => json.encode(data.toJson());

class AllCharactersDTO extends AllCharacters {
  AllCharactersDTO({
    required InfoDTO info,
    required List<CharacterDTO> results,
  }) : super(
          characters: results,
          info: info,
        );

  factory AllCharactersDTO.fromJson(Map<String, dynamic> json) =>
      AllCharactersDTO(
        info: InfoDTO.fromJson(json["info"]),
        results: List<CharacterDTO>.from(
            json["results"].map((x) => CharacterDTO.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "info": info.toJson(),
  //       "results": List<dynamic>.from(results.map((x) => x.toJson())),
  //     };
}

class InfoDTO extends Info {
  InfoDTO({
    required int count,
    required int pages,
    required String next,
    required dynamic prev,
  }) : super(
          count: count,
          pages: pages,
          next: next,
          prev: prev,
        );

  factory InfoDTO.fromJson(Map<String, dynamic> json) => InfoDTO(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
