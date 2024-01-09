import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_group_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class YaruMenuHeader extends ConsumerWidget {
  const YaruMenuHeader({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final homeTool = getToolByName("home");

    final headerTools = [homeTool];

    headerTools.addAll(ref
        .watch(settingsProvider)
        .favorites
        .map((e) => allTools.firstWhere((t) => e == t.name))
        .toList());

    return Column(
      children: ListTile.divideTiles(
          context: context,
          tiles: headerTools.map<ListTile>((Tool tool) {
            return ListTile(
              title: Text(tool.fullTitle),
              selected: ref.watch(selectedToolProvider).name == tool.name,
              leading: Icon(tool.icon),
              onTap: () {
                if (tool.name == "home") {
                  ref.read(selectedGroupProvider.notifier).state = null;
                }
                ref.read(selectedToolProvider.notifier).state = tool;
                context.go(tool.route);
              },
            );
          })).toList(),
    );
  }
}
