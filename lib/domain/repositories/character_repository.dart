import 'package:dartz/dartz.dart';
import 'package:the_character_viewer/domain/entities/character.dart';

import '../../core/error/failure.dart';

abstract class CharacterRepository {
  // API methods
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
}
