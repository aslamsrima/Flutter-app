import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_character_viewer/core/helpers/helper.dart';
import 'package:the_character_viewer/data/models/character_model.dart';
import 'package:the_character_viewer/domain/entities/character.dart';

import '../../helpers/json_reader.dart';

void main() {
  const characterDetail = CharacterModel(
      name: 'Apu Nahasapeemapetilon',
      description:
          "Apu Nahasapeemapetilon is a recurring character in the American animated television series The Simpsons. He is an Indian immigrant proprietor who runs the Kwik-E-Mart, a popular convenience store in Springfield, and is known for his catchphrase, \"Thank you, come again\".",
      iconUrl: '/i/99b04638.png');
  const testCharactersModal = [characterDetail];

  test('should be a subclass of character entity', () async {
    //assert
    expect(testCharactersModal, isA<List<CharacterEntity>>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_character_response.json'),
    );
    final relatedTopics = jsonMap['RelatedTopics'] as List<dynamic>;
    final characterModels = parseCharacterModels(relatedTopics);

    //act

    //assert
    expect(characterModels, equals(testCharactersModal));
  });

  test(
    'should return a json map containing proper data',
    () async {
      // act
      final result = characterDetail.toJson();

      // assert
      final expectedJsonMap = {
        'name': 'Apu Nahasapeemapetilon',
        'description':
            "Apu Nahasapeemapetilon is a recurring character in the American animated television series The Simpsons. He is an Indian immigrant proprietor who runs the Kwik-E-Mart, a popular convenience store in Springfield, and is known for his catchphrase, \"Thank you, come again\".",
        'iconUrl': '/i/99b04638.png',
      };

      expect(result, equals(expectedJsonMap));
    },
  );
}
