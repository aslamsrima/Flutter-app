import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_character_viewer/core/error/failure.dart';
import 'package:the_character_viewer/domain/entities/character.dart';
import 'package:the_character_viewer/presentation/blocs/character_bloc.dart';
import 'package:the_character_viewer/presentation/blocs/character_event.dart';
import 'package:the_character_viewer/presentation/blocs/character_state.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetCharactersUseCase mockGetCharactersUseCase;
  late CharacterBloc characterBloc;

  setUp(() {
    mockGetCharactersUseCase = MockGetCharactersUseCase();
    characterBloc = CharacterBloc(mockGetCharactersUseCase);
  });

  const testCharacterEntity = CharacterEntity(
    name: 'Apu Nahasapeemapetilon',
    description:
        "Apu Nahasapeemapetilon is a recurring character in the American animated television series The Simpsons. He is an Indian immigrant proprietor who runs the Kwik-E-Mart, a popular convenience store in Springfield, and is known for his catchphrase, \"Thank you, come again\".",
    iconUrl: '/i/99b04638.png',
  );

  group('CharacterBloc', () {
    test('initial state should be empty', () {
      expect(characterBloc.state, CharacterEmpty());
    });

    blocTest<CharacterBloc, CharacterState>(
      'should emit [CharacterLoading, CharacterLoaded] when data is gotten successfully',
      build: () {
        when(mockGetCharactersUseCase.execute())
            .thenAnswer((_) async => Right([testCharacterEntity]));
        return characterBloc;
      },
      act: (bloc) => bloc.add(FetchCharactersEvent()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        CharacterLoading(),
        CharacterLoaded([testCharacterEntity]),
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'should emit [CharacterLoading, CharacterFailure] when get data is unsuccessful',
      build: () {
        when(mockGetCharactersUseCase.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server failure')));
        return characterBloc;
      },
      act: (bloc) => bloc.add(FetchCharactersEvent()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        CharacterLoading(),
        const CharacterFailure('Server failure'),
      ],
    );
  });
}
