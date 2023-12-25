import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../domain/entities/character.dart';

class AppImage extends StatelessWidget {
  final CharacterEntity character;
  final double imageSize;

  const AppImage({
    required this.character,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
          errorWidget: (context, _, __) => Image(
            fit: BoxFit.contain,
            width: imageSize,
            height: imageSize,
            image: const AssetImage('assets/images/no_image.png'),
          ),
          imageUrl: Urls.characterImage(character.iconUrl),
          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
