class LinuxMenuItem {
  final String label;
  final String route;

  LinuxMenuItem(this.label, this.route);

  String toLowerCase() {
    return label.toLowerCase();
  }
}
