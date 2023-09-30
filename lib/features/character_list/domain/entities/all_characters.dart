import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';

class AllCharacters {
  final Info info;
  final List<Character> characters;

  AllCharacters({
    required this.info,
    required this.characters,
  });
}

class Info {
  int count;
  int pages;
  String next;
  dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
}
