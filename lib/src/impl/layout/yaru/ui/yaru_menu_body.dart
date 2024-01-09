import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/groups.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_group_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class YaruMenuBody extends ConsumerWidget {
  const YaruMenuBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: YaruExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          ref.read(selectedGroupProvider.notifier).state = allGroups[index];
        },
        children: allGroups.map<ExpansionPanel>((Group group) {
          return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return GestureDetector(
                onTap: () {
                  final home = getToolByName("home");
                  ref.read(selectedToolProvider.notifier).state = home;
                  if (ref.watch(selectedGroupProvider)?.name == group.name) {
                    ref.read(selectedGroupProvider.notifier).state = null;
                  } else {
                    ref.read(selectedGroupProvider.notifier).state = group;
                  }
                  context.go(home.route);
                },
                child: ListTile(
                  title: Text(group.name),
                  leading: Icon(group.icon),
                  hoverColor: Colors.transparent,
                  tileColor: Colors.transparent,
                  selectedTileColor: Colors.transparent,
                  selected:
                      ref.watch(selectedGroupProvider)?.name == group.name,
                ),
              );
            },
            isExpanded: ref.watch(selectedGroupProvider)?.name == group.name,
            body: Column(
              children: ListTile.divideTiles(
                  context: context,
                  tiles: allTools
                      .where((t) => t.group.name == group.name)
                      .map<ListTile>((Tool tool) {
                    return ListTile(
                      title: Text(tool.shortTitle),
                      selected:
                          ref.watch(selectedToolProvider).name == tool.name,
                      leading: Icon(tool.icon),
                      onTap: () {
                        ref.read(selectedToolProvider.notifier).state = tool;
                        context.go(tool.route);
                      },
                    );
                  })).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
