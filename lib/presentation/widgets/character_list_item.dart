import 'package:flutter/material.dart';
import 'package:the_character_viewer/domain/entities/character.dart';

class CharacterListItem extends StatelessWidget {
  final CharacterEntity character;
  final bool isSelected; // New property to track if the item is selected
  final VoidCallback onCharacterSelected;

  const CharacterListItem({
    required this.character,
    required this.isSelected,
    required this.onCharacterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        character.name,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onCharacterSelected,
    );
  }
}
