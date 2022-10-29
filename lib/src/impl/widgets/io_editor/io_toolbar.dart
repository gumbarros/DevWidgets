import 'package:flutter/material.dart';

class IOToolbar extends StatelessWidget {
  const IOToolbar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Flexible(
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0,
              children: actions ?? [],
            ),
          )
        ],
      ),
    );
  }
}
