enum Flavor {
  simpsonsviewer,
  wireviewer,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.simpsonsviewer:
        return 'Simpsons Character Viewer';
      case Flavor.wireviewer:
        return 'The Wire Character Viewer';
      default:
        return 'title';
    }
  }

}
