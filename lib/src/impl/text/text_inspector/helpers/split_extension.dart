extension Split on String {
  List<String?> splitWords() {
    return RegExp(r"\w+").allMatches(this).map((e) => e.group(0))
        .toList();
  }
}
