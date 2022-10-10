import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/presentation/global_settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Visibility(
          visible:
              !context.layout.breakpoint.isS && !context.layout.breakpoint.isXs,
          child: IconButton(
            icon: FaIcon(FontAwesomeIcons.bars),
            onPressed: () {
              GlobalSettings.compactMode.value =
                  !GlobalSettings.compactMode.value;
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.settings),
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
