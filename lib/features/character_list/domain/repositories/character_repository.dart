import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/error/failures.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/all_characters.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';

abstract class CharacterRepository {
  // Future<Either<Failure, List<Character>>> getCharacterList();
  Future<Either<Failure, AllCharacters>> getAllCharacters(int page);
  Future<Either<Failure, Character>> getSingleCharacter(int id);
}
