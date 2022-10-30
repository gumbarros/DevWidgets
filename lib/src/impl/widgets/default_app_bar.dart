import 'package:dev_widgets/src/routes.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/compact_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: responsive.ResponsiveVisibility(
          hiddenWhen: const [responsive.Condition.smallerThan(name: "TABLET")],
          replacement: Consumer(
            builder: (context, ref, child) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  ref.read(isCompactModeProvider.notifier).state = false;
                  Scaffold.of(context).openDrawer();
                }),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              bool isCompactMode = ref.watch(isCompactModeProvider);
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  ref.read(isCompactModeProvider.notifier).state =
                      !isCompactMode;
                },
              );
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => context.go(Routes.settings),
              icon: const Icon(Icons.settings))
        ],
        title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
