import 'package:dev_widgets/src/impl/layout/yaru/providers/is_drawer_open_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;
import 'package:url_launcher/url_launcher_string.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: responsive.ResponsiveVisibility(
          hiddenWhen: const [
            responsive.Condition.smallerThan(name: 'TABLET_LARGE')
          ],
          replacement: Consumer(
            builder: (context, ref, child) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  ref.read(isDrawerOpenProvider.notifier).state = false;
                  Scaffold.of(context).openDrawer();
                }),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              bool isCompactMode = ref.watch(isDrawerOpenProvider);
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  ref.read(isDrawerOpenProvider.notifier).state =
                      !isCompactMode;
                },
              );
            },
          ),
        ),
        actions: [
          Visibility(
            visible: kIsWeb,
            child: IconButton(
                onPressed: () {
                  launchUrlString(
                      "https://github.com/gumbarros/DevWidgets/releases/tag/latest");
                },
                tooltip: "download_desktop_version".tr(),
                icon: const Icon(
                  Icons.download,
                )),
          ),
          Consumer(
            builder: (context, ref, child) => IconButton(
                onPressed: () {
                  ref.read(selectedToolProvider.notifier).state =
                      getToolByName("settings");
                  context.go(Routes.settings);
                },
                tooltip: "settings".tr(),
                icon: const Icon(
                  Icons.settings,
                )),
          ),
        ],
        title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
