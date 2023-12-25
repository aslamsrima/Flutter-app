import 'dart:convert';

import 'package:the_character_viewer/core/constants/constants.dart';
import 'package:the_character_viewer/data/models/character_model.dart';

import 'package:http/http.dart' as http;

import '../../core/error/exception.dart';
import '../../core/helpers/helper.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacters();
}

class CharacterRemoteDataSourceImpl extends CharacterRemoteDataSource {
  final http.Client client;
  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final response = await client.get(Uri.parse(Urls.characterList()));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final relatedTopics = jsonData['RelatedTopics'] as List<dynamic>;
      final characterModels = parseCharacterModels(relatedTopics);
      return characterModels;
    } else {
      throw ServerException();
    }
  }
}
