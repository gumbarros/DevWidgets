import 'package:dev_widgets/src/impl/layout/yaru/providers/compact_mode_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/tools/home/home_tool.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/src/impl/layout/yaru/models/yaru_menu_item.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu_search_box.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu_tile.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
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

    return ListView(
      children: [
        Visibility(
          visible: !ref.watch(isCompactModeProvider),
          child: Container(
              width: Get.width,
              padding: const EdgeInsets.all(8.0),
              height: 50,
              child: YaruMenuSearchBox(
                tools: tools
                    .map((t) => LinuxMenuItem(t.homeTitle, t.route))
                    .toList(),
                controller: TextEditingController(),
              )),
        ),
        Visibility(
            visible: ref.watch(isCompactModeProvider), child: const Divider()),
        Column(
          children: <Widget>[
            YaruMenuTile(
              selected: selectedToolName == HomeTool().name.toString(),
              title: YaruPageItemTitle.text(HomeTool().menuTitle),
              icon: HomeTool().icon,
              onTap: () {
                ref.read(selectedToolProvider.notifier).state =
                    HomeTool().name.toString();
                Get.toNamed(HomeTool().route);
              },
            ),
            for (Tool tool in ref
                .watch(settingsProvider)
                .favorites
                .map((e) => tools.firstWhere((t) => e == t.name)))
              YaruMenuTile(
                selected: ref.watch(selectedToolProvider) == tool.name,
                title: Text(tool.homeTitle),
                icon: tool.icon,
                onTap: () {
                  ref.read(selectedToolProvider.notifier).state = tool.name;
                  Get.toNamed(tool.route);
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
        const Divider(),
        Column(
          children: [
            for (var group in Get.find<List<Group>>())
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
                          Get.toNamed('/home', arguments: [group.name]);
                        }),
                  ),
                  child: YaruExpandable(
                    isExpanded: true,
                    onChange: (_) => Get.toNamed('/home'),
                    header: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: !ref.watch(isCompactModeProvider)
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            Icon(group.icon),
                            Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child:
                                  Text(group.name, overflow: TextOverflow.fade),
                            )
                          ]),
                    ),
                    child: Column(children: [
                      for (var tool
                          in tools.where((t) => t.group.name == group.name))
                        YaruMenuTile(
                          selected:
                              ref.watch(selectedToolProvider) == tool.name,
                          title: YaruPageItemTitle.text(tool.menuTitle),
                          icon: tool.icon,
                          onTap: () {
                            ref.read(selectedToolProvider.notifier).state =
                                tool.name;
                            Get.offAllNamed(tool.route);
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
