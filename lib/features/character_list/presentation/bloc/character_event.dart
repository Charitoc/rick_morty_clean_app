part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class FetchAllCharacters extends CharacterEvent {
  final int page;
  const FetchAllCharacters({
    required this.page,
  });
}

class FetchNextPageCharacters extends CharacterEvent {
  final int page;
  const FetchNextPageCharacters({
    required this.page,
  });
}

class FetchSingleCharacter extends CharacterEvent {
  final int id;

  const FetchSingleCharacter({
    required this.id,
  });
}
