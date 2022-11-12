class YaruMenuItem {
  final String name;
  final String label;
  final String route;

  const YaruMenuItem(this.name, this.label, this.route);

  @override
  String toString() {
    return label;
  }
}
