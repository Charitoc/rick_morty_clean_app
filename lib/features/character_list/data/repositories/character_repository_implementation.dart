import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/error/failures.dart';
import 'package:rick_and_morty/features/character_list/data/datasources/character_remote_datasource.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/all_characters.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';
import 'package:rick_and_morty/features/character_list/domain/repositories/character_repository.dart';

class CharacterRepositoryImplementation implements CharacterRepository {
  final CharacterRemoteDatasource characterRemoteDatasource;

  CharacterRepositoryImplementation(this.characterRemoteDatasource);

  // @override
  // Future<Either<Failure, List<Character>>> getCharacterList() async {
  //   return Right(await characterRemoteDatasource.getCharacterList([]));
  // }

  @override
  Future<Either<Failure, Character>> getSingleCharacter(int id) async {
    return Right(await characterRemoteDatasource.getSingleCharacter(
      id.toString(),
    ));
  }

  @override
  Future<Either<Failure, AllCharacters>> getAllCharacters(int page) async {
    try {
      if (page == 1) {
        return Right(await characterRemoteDatasource.getAllCharacters());
      } else {
        return Right(
            await characterRemoteDatasource.getNextPageCharacters(page));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
