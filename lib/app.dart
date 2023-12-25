import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_character_viewer/presentation/blocs/character_bloc.dart';

import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/character_repository_impl.dart';
import 'domain/usecases/get_characters.dart';
import 'flavors.dart';
import 'presentation/screens/characters_screen.dart';
import 'package:http/http.dart' as http;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();

    return BlocProvider(
        create: (context) => CharacterBloc(
              GetCharactersUseCase(
                CharacterRepositoryImpl(
                  characterRemoteDataSource:
                      CharacterRemoteDataSourceImpl(client: httpClient),
                ),
              ),
            ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: F.title,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CharactersScreen(
            title: F.title,
          ),
        ));
  }
}
