import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/presentation/widgets/layout/landscape_layout.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            LandscapeLayout.compactMode.value =
                !LandscapeLayout.compactMode.value;
          },
        ),
        title: AutoSizeText(
          title,
          style: const TextStyle(fontSize: 24),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
