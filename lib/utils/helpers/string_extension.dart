extension StringExtension on String {
  /// Capitaliza la primera letra de cada palabra
  /// Ej: "jesus david bovea" -> "Jesus David Bovea"
  String capitalizeWords() {
    if (trim().isEmpty) return this;

    return trim()
        .split(RegExp(r'\s+'))
        .map((word) {
          if (word.isEmpty) return word;

          return word[0].toUpperCase() +
              word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  /// Capitaliza solo la primera letra del texto completo
  /// Ej: "jesus david" -> "Jesus david"
  String capitalizeFirst() {
    if (trim().isEmpty) return this;

    final value = trim();

    return value[0].toUpperCase() +
        value.substring(1).toLowerCase();
  }
}