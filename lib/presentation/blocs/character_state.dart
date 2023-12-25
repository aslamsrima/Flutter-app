import 'package:equatable/equatable.dart';
import 'package:the_character_viewer/domain/entities/character.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object?> get props => [];
}

class CharacterEmpty extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> result;

  const CharacterLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class CharacterFailure extends CharacterState {
  final String message;

  const CharacterFailure(this.message);

  @override
  List<Object?> get props => [message];
}
