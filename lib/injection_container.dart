import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/remote_api_client.dart';
import 'package:rick_and_morty/features/character_list/data/datasources/character_remote_datasource.dart';
import 'package:rick_and_morty/features/character_list/data/repositories/character_repository_implementation.dart';
import 'package:rick_and_morty/features/character_list/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/features/character_list/domain/usecases/get_character_list.dart';
import 'package:rick_and_morty/features/character_list/domain/usecases/get_single_character.dart';
import 'package:rick_and_morty/features/character_list/presentation/bloc/character_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => CharacterBloc(
        getSingleCharacter: sl(),
        getCharacterList: sl(),
      ));

  sl.registerLazySingleton(
    () => GetCharacterList(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetSingleCharacter(
      sl(),
    ),
  );

  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImplementation(
      sl(),
    ),
  );

  sl.registerLazySingleton<CharacterRemoteDatasource>(
    () => CharacterRemoteDatasourceImpl(
      remoteApiClient: sl(),
    ),
  );

  sl.registerLazySingleton(() => RemoteApiClient());
}
