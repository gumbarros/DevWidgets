import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultDrawer extends ConsumerWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
        child: YaruMenu(
      selectedToolName: ref.watch(selectedToolProvider),
      tools: allTools,
    ));
  }
}
