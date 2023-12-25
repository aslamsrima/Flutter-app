import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  const CharacterEntity({
    required this.name,
    required this.description,
    required this.iconUrl,
  });

  final String name;
  final String description;
  final String iconUrl;

  @override
  List<Object?> get props => [name, description, iconUrl];
}
