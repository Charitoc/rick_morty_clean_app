part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

final class CharacterLoadingState extends CharacterState {}

class CharactersLoadedState extends CharacterState {
  const CharactersLoadedState({
    required this.characters,
  });

  final List<Character> characters;

  CharactersLoadedState copyWith({
    List<Character>? characters,
  }) {
    return CharactersLoadedState(
      characters: characters ?? this.characters,
    );
  }

  @override
  List<Object> get props => [characters];
}
