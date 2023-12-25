import 'package:the_character_viewer/flavors.dart';

/// Utility class to manage URLs based on the app's flavor.
class Urls {
  static String characterList() {
    switch (F.appFlavor) {
      case Flavor.simpsonsviewer:
        return 'http://api.duckduckgo.com?q=simpsons+characters&format=json';
      case Flavor.wireviewer:
        return 'http://api.duckduckgo.com/?q=the+wire+characters&format=json';
      default:
        return 'http://api.duckduckgo.com?q=simpsons+characters&format=json';
    }
  }

  /// Constructs the URL for a character's image.
  static String characterImage(String imageName) {
    if (imageName.isNotEmpty) {
      return 'https://duckduckgo.com/$imageName';
    } else {
      return '';
    }
  }
}
