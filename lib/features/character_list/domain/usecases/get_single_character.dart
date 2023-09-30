import 'package:dartz/dartz.dart';

import 'package:rick_and_morty/core/error/failures.dart';
import 'package:rick_and_morty/core/usecases/usecase.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';
import 'package:rick_and_morty/features/character_list/domain/repositories/character_repository.dart';

class GetSingleCharacter implements UseCase<Character, Params> {
  final CharacterRepository characterRepository;

  GetSingleCharacter(this.characterRepository);

  @override
  Future<Either<Failure, Character>> call(Params params) async {
    return await characterRepository.getSingleCharacter(params.id);
  }
}

class Params {
  final int id;
  Params({
    required this.id,
  });
}
