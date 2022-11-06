import 'package:dev_widgets/src/impl/layout/yaru/providers/is_drawer_open_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;
import 'package:yaru/yaru.dart';

class YaruLayout extends ConsumerWidget {
  final Widget? child;

  const YaruLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    return YaruTheme(
      data: YaruThemeData(
          highContrast: settings.highContrast,
          variant: settings.yaruVariant,
          themeMode: settings.themeMode),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  responsive.ResponsiveVisibility(
                    hiddenWhen: const [
                      responsive.Condition.smallerThan(name: 'TABLET_LARGE')
                    ],
                    visible: !ref.watch(isDrawerOpenProvider),
                      child: Container(
                        width:MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: const YaruMenu(),
                      ),
                  ),
                  Expanded(
                    child: child ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
