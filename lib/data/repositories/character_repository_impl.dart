import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:the_character_viewer/core/error/exception.dart';
import 'package:the_character_viewer/core/error/failure.dart';
import 'package:the_character_viewer/domain/entities/character.dart';
import 'package:the_character_viewer/domain/repositories/character_repository.dart';

import '../data_sources/remote_data_source.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterRemoteDataSource characterRemoteDataSource;
  CharacterRepositoryImpl({required this.characterRemoteDataSource});

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    try {
      final characters = await characterRemoteDataSource.getCharacters();
      final result = characters.map((item) {
        return item.toEntity();
      }).toList();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
