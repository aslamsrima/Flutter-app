import 'package:the_character_viewer/domain/entities/character.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel(
      {required String name,
      required String description,
      required String iconUrl})
      : super(name: name, description: description, iconUrl: iconUrl);

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      iconUrl: json['iconUrl'] ?? '',
    );
  }

  CharacterEntity toEntity() =>
      CharacterEntity(name: name, description: description, iconUrl: iconUrl);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'iconUrl': iconUrl,
      };
}
