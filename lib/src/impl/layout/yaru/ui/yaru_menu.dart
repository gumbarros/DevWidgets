import 'package:dev_widgets/src/impl/groups.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/compact_mode_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/layout/yaru/models/yaru_menu_item.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu_search_box.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu_tile.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

const double _kScrollbarThickness = 8.0;
const double _kScrollbarMargin = 2.0;

class YaruMenu extends ConsumerWidget {
  const YaruMenu(
      {super.key, required this.selectedToolName, required this.tools});

  final List<Tool> tools;
  final String selectedToolName;

  @override
  Widget build(BuildContext context, ref) {
    final scrollbarThicknessWithTrack =
        _calcScrollbarThicknessWithTrack(context);

    final homeTool = getToolByName("home");

    return ListView(
      children: [
        Visibility(
          visible: !ref.watch(isCompactModeProvider),
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              height: 50,
              child: YaruMenuSearchBox(
                tools: tools
                    .map((t) => YaruMenuItem(t.homeTitle, t.route))
                    .toList(),
                controller: TextEditingController(),
              )),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scrollbarThicknessWithTrack,
            vertical: 8.0,
          ),
          child: Column(
            children: <Widget>[
              YaruMenuTile(
                selected: selectedToolName == homeTool.name.toString(),
                title: YaruPageItemTitle.text(homeTool.menuTitle),
                icon: homeTool.icon,
                onTap: () {
                  ref.read(selectedToolProvider.notifier).state =
                      homeTool.name.toString();
                  context.go(homeTool.route);
                },
              ),
              for (Tool tool in ref
                  .watch(settingsProvider)
                  .favorites
                  .map((e) => tools.firstWhere((t) => e == t.name)))
                YaruMenuTile(
                  selected: selectedToolName == tool.name,
                  title: YaruPageItemTitle.text(
                    tool.homeTitle,
                  ),
                  icon: tool.icon,
                  onTap: () {
                    ref.read(selectedToolProvider.notifier).state = tool.name;
                    context.go(tool.route);
                  },
                ),
            ]
                .map((e) => Container(
                      padding: ref.watch(isCompactModeProvider)
                          ? const EdgeInsets.all(8.0)
                          : null,
                      child: e,
                    ))
                .toList(),
          ),
        ),
        const Divider(),
        Column(
          children: [
            for (var group in allGroups)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: scrollbarThicknessWithTrack,
                  vertical: 8.0,
                ),
                child: Visibility(
                  visible: !ref.watch(isCompactModeProvider),
                  replacement: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        icon: Icon(group.icon),
                        onPressed: () {
                          context.go('/home');
                        }),
                  ),
                  child: YaruExpandable(
                    isExpanded: true,
                    onChange: (_) => context.go('/home'),
                    header: SizedBox(
                      width: 200,
                      child: YaruMenuTile(
                          icon: group.icon,
                          selected: false,
                          title: YaruPageItemTitle.text(
                            group.name,
                          )),
                    ),
                    child: Column(children: [
                      for (var tool
                          in tools.where((t) => t.group.name == group.name))
                        YaruMenuTile(
                          selected: selectedToolName == tool.name,
                          title: YaruPageItemTitle.text(tool.menuTitle),
                          icon: tool.icon,
                          onTap: () {
                            ref.watch(selectedToolProvider.notifier).state =
                                tool.name;
                            context.go(tool.route);
                          },
                        )
                    ]),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }

  double _calcScrollbarThicknessWithTrack(final BuildContext context) {
    final scrollbarTheme = Theme.of(context).scrollbarTheme;

    final doubleMarginWidth = scrollbarTheme.crossAxisMargin != null
        ? scrollbarTheme.crossAxisMargin! * 2
        : _kScrollbarMargin * 2;

    final scrollBarThumbThikness =
        scrollbarTheme.thickness?.resolve({MaterialState.hovered}) ??
            _kScrollbarThickness;

    return doubleMarginWidth + scrollBarThumbThikness;
  }
}
