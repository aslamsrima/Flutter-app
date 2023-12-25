import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_character_viewer/core/constants/constants.dart';
import 'package:the_character_viewer/core/error/exception.dart';
import 'package:the_character_viewer/data/data_sources/remote_data_source.dart';
import 'package:the_character_viewer/data/models/character_model.dart';
import 'package:http/http.dart' as http;

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late CharacterRemoteDataSourceImpl characterRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    characterRemoteDataSourceImpl =
        CharacterRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get characters list', () {
    test('should return character list model when the response code is 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.characterList()))).thenAnswer(
          (_) async => http.Response(
              readJson('helpers/dummy_data/dummy_character_response.json'),
              200));

      //act
      final result = await characterRemoteDataSourceImpl.getCharacters();

      //assert
      expect(result, isA<List<CharacterModel>>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(Urls.characterList())),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = characterRemoteDataSourceImpl.getCharacters();

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
