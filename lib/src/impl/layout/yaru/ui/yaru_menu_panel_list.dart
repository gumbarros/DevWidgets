import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_group_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class YaruMenuPanelList extends ConsumerWidget {
  final List<Group> groups;

  const YaruMenuPanelList(this.groups, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return YaruExpansionPanelList(

      expansionCallback: (int index, bool isExpanded) {
        ref.read(selectedGroupProvider.notifier).state = groups[index];
      },
      children: groups.map<ExpansionPanel>((Group group) {
        return ExpansionPanel(
          canTapOnHeader: false,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(group.name),
              leading: Icon(group.icon),
              onTap: (){
                final home = getToolByName("home");
                ref.read(selectedToolProvider.notifier).state = home;
                ref.read(selectedGroupProvider.notifier).state = group;
                context.go(home.route);
              },
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
                    selected: ref.watch(selectedToolProvider).name == tool.name,
                    leading: Icon(tool.icon),
                    onTap: () {
                      ref.read(selectedToolProvider.notifier).state =
                          tool;
                      context.go(tool.route);
                    },
                  );
                })).toList(),
          ),
        );
      }).toList(),
    );
  }
}