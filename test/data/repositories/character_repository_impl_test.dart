import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_character_viewer/core/error/exception.dart';
import 'package:the_character_viewer/core/error/failure.dart';
import 'package:the_character_viewer/data/repositories/character_repository_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockCharacterRemoteDataSource mockCharacterRemoteDataSource;
  late CharacterRepositoryImpl characterRepositoryImpl;

  setUp(() {
    mockCharacterRemoteDataSource = MockCharacterRemoteDataSource();
    characterRepositoryImpl = CharacterRepositoryImpl(
        characterRemoteDataSource: mockCharacterRemoteDataSource);
  });

  group('get characters', () {
    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockCharacterRemoteDataSource.getCharacters())
            .thenThrow(ServerException());

        // act
        final result = await characterRepositoryImpl.getCharacters();

        // assert
        expect(
            result, equals(const Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockCharacterRemoteDataSource.getCharacters()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await characterRepositoryImpl.getCharacters();

        // assert
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });
}
