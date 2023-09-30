import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rick_and_morty/core/error/failures.dart';
import 'package:rick_and_morty/core/usecases/usecase.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/all_characters.dart';
import 'package:rick_and_morty/features/character_list/domain/repositories/character_repository.dart';

class GetCharacterList implements UseCase<AllCharacters, ParamsOnAllChars> {
  final CharacterRepository characterRepository;

  GetCharacterList(this.characterRepository);

  @override
  Future<Either<Failure, AllCharacters>> call(ParamsOnAllChars params) async {
    return await characterRepository.getAllCharacters(params.page);
  }
}

class ParamsOnAllChars extends Equatable {
  final int page;
  const ParamsOnAllChars({
    required this.page,
  });

  @override
  List<Object?> get props => [
        page,
      ];
}
