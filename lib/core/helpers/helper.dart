import 'package:the_character_viewer/data/models/character_model.dart';

List<CharacterModel> parseCharacterModels(List<dynamic> relatedTopics) {
  return relatedTopics.map((topic) {
    List<String> parts = topic['Text'].split(" - ");
    final characterName = parts[0];
    String characterDescription = '';
    if (parts.length > 1) {
      characterDescription = parts[1];
    }
    final iconUrl = topic['Icon']['URL'] ?? '';
    return CharacterModel(
      name: characterName,
      description: characterDescription,
      iconUrl: iconUrl,
    );
  }).toList();
}
