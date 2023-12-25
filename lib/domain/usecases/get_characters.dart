import 'package:dartz/dartz.dart';
import 'package:the_character_viewer/core/error/failure.dart';
import 'package:the_character_viewer/domain/entities/character.dart';
import 'package:the_character_viewer/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository characterRepository;

  GetCharactersUseCase(this.characterRepository);
  Future<Either<Failure, List<CharacterEntity>>> execute() {
    return characterRepository.getCharacters();
  }
}
