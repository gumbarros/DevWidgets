import 'package:dev_widgets/src/impl/presentation/layout/yaru/providers/compact_mode_provider.dart';
import 'package:dev_widgets/src/impl/presentation/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/src/impl/presentation/layout/yaru/ui/yaru_menu.dart';
import 'package:dev_widgets/src/impl/presentation/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yaru/yaru.dart';

class YaruLayout extends ConsumerWidget {
  final Widget? child;
  final List<Tool> tools;

  const YaruLayout({super.key, required this.child, required this.tools});

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
                  AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      width: ref.watch(isCompactModeProvider)
                          ? 80
                          : MediaQuery.of(context).size.width / 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: YaruMenu(
                          tools: tools,
                          selectedToolName: ref.watch(selectedToolProvider),
                        ),
                      ),
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
