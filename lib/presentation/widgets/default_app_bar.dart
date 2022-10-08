import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/presentation/layout/landscape_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.bars),
          onPressed: () {
            LandscapeLayout.compactMode.value =
                !LandscapeLayout.compactMode.value;
          },
        ),
        actions: [
          IconButton(
              onPressed: () => Get.snackbar("PLACEHOLDER", "This is a W.I.P"),
              icon: FaIcon(FontAwesomeIcons.gear))
        ],
        title: AutoSizeText(
          title,
          style: const TextStyle(fontSize: 24),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
