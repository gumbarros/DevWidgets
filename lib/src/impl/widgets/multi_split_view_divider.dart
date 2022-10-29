import 'package:flutter/material.dart';

class MultiSplitViewDivider extends StatelessWidget {
  final bool dragging;

  final bool highlighted;

  const MultiSplitViewDivider(
      {super.key, required this.dragging, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
    );
  }
}
