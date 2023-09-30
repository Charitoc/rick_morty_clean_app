import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';

import 'package:rick_and_morty/features/character_list/domain/usecases/get_character_list.dart';
import 'package:rick_and_morty/features/character_list/domain/usecases/get_single_character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetSingleCharacter getSingleCharacter;
  final GetCharacterList getCharacterList;

  CharacterBloc({
    required this.getSingleCharacter,
    required this.getCharacterList,
  }) : super(CharacterInitial()) {
    on<FetchAllCharacters>((event, emit) async {
      emit(CharacterLoadingState());
      final characters =
          await getCharacterList.call(ParamsOnAllChars(page: event.page));
      characters.fold(
        (failure) => null,
        (characters) => emit(
          CharactersLoadedState(
            characters: characters.characters,
          ),
        ),
      );
    });

    on<FetchNextPageCharacters>((event, emit) async {
      var currentState = state as CharactersLoadedState;

      final characters =
          await getCharacterList.call(ParamsOnAllChars(page: event.page));
      characters.fold(
        (failure) => null,
        (characters) => emit(
          CharactersLoadedState(
            characters: currentState.characters + characters.characters,
          ),
        ),
      );
    });

    on<FetchSingleCharacter>((event, emit) {
      getSingleCharacter.call(Params(id: event.id));
    });
  }
}
