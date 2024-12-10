part of autocloud.ui.ds;

class ACPFont {
  static TextStyle smallMono(TextStyle overrides) => const TextStyle(
        fontFamily: 'IBMPlexMono',
        fontSize: 12,
      ).merge(overrides);

  static TextStyle pageTitle(TextStyle overrides) => const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ).merge(overrides);

  static TextStyle viewTitle(TextStyle overrides) => const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 26,
        fontWeight: FontWeight.w200,
      ).merge(overrides);

  static TextStyle paneTitle(TextStyle overrides) => const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ).merge(overrides);
}
