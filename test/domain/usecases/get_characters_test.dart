import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_character_viewer/domain/entities/character.dart';
import 'package:the_character_viewer/domain/usecases/get_characters.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCharactersUseCase getCharactersUseCase;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharactersUseCase = GetCharactersUseCase(mockCharacterRepository);
  });

  const testCharactersDetail = CharacterEntity(
      name: 'Milhouse Van Houten',
      description:
          " Milhouse Mussolini Van Houten is a recurring character in the Fox animated television series The Simpsons voiced by Pamela Hayden and created by Matt Groening. Milhouse is Bart Simpson's best friend in Mrs. Krabappel's fourth grade class at Springfield Elementary School.",
      iconUrl: '/i/c1923cb1.png');

  final testCharactersList = [testCharactersDetail];

  test('should get character list from the repository', () async {
    // arrange
    when(mockCharacterRepository.getCharacters())
        .thenAnswer((_) async => Right(testCharactersList));

    // act
    final result = await getCharactersUseCase.execute();

    // assert
    expect(result, Right(testCharactersList));
  });
}
