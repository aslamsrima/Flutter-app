import 'package:flutter/material.dart';
import 'package:the_character_viewer/domain/entities/character.dart';

import '../widgets/app_images.dart';

class CharacterDetailScreen extends StatefulWidget {
  final CharacterEntity character;

  CharacterDetailScreen({required this.character});

  @override
  _CharacterDetailScreen createState() => _CharacterDetailScreen();
}

class _CharacterDetailScreen extends State<CharacterDetailScreen> {
  bool isTablet = false;

  // CharacterDetailScreen({required this.character});

  Widget _buildCharacterName() {
    return Text(
      widget.character.name,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCharacterDescription() {
    return Text(
      widget.character.description,
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final isTablet =
        isPortrait ? mediaQuery.size.width > 600 : mediaQuery.size.height > 600;

    return Scaffold(
      appBar: !isTablet
          ? AppBar(
              title: Text(widget.character.name),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: OrientationBuilder(
            builder: (context, orientation) {
              double imageSize =
                  orientation == Orientation.portrait ? 200 : 150;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppImage(
                      character: widget.character,
                      imageSize: imageSize,
                    ),
                    const SizedBox(height: 16),
                    _buildCharacterName(),
                    const SizedBox(height: 16),
                    _buildCharacterDescription(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
