import 'package:rick_and_morty/core/error/exceptions.dart';
import 'package:rick_and_morty/core/remote_api_client.dart';
import 'package:rick_and_morty/features/character_list/data/models/character_dto.dart';
import 'package:rick_and_morty/features/character_list/data/models/character_list_dto.dart';

abstract class CharacterRemoteDatasource {
  // Future<AllCharacters> getCharacterList(List<String> characters);

  Future<AllCharactersDTO> getAllCharacters();

  Future<AllCharactersDTO> getNextPageCharacters(int page);

  Future<CharacterDTO> getSingleCharacter(String id);
}

class CharacterRemoteDatasourceImpl implements CharacterRemoteDatasource {
  final RemoteApiClient remoteApiClient;
  CharacterRemoteDatasourceImpl({
    required this.remoteApiClient,
  });

  // @override
  // Future<List<CharacterDTO>> getCharacterList(List<String> characters) async {
  //   final response = await remoteApiClient.get('character/$characters');
  //   if (response.statusCode == 200) {
  //     return CharacterListDTO.charactersFromJson(response as String);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  @override
  Future<CharacterDTO> getSingleCharacter(String id) async {
    final response = await remoteApiClient.get('character/$id');
    if (response.statusCode == 200) {
      return CharacterDTO.fromJson(response.data!);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AllCharactersDTO> getAllCharacters() async {
    final response = await remoteApiClient.get('character');
    if (response.statusCode == 200) {
      return AllCharactersDTO.fromJson(response.data!);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AllCharactersDTO> getNextPageCharacters(int page) async {
    final response = await remoteApiClient.get('character/?page=$page');
    if (response.statusCode == 200) {
      return AllCharactersDTO.fromJson(response.data!);
    } else {
      throw ServerException();
    }
  }
}
