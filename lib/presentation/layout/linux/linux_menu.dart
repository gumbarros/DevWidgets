import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/tools/home_tool.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:dev_widgets/presentation/layout/linux/linux_menu_item.dart';
import 'package:dev_widgets/presentation/layout/linux/linux_menu_search_box.dart';
import 'package:dev_widgets/presentation/layout/linux/linux_menu_tile.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

const double _kScrollbarThickness = 8.0;
const double _kScrollbarMargin = 2.0;

class LinuxMenu extends StatelessWidget {
  const LinuxMenu(
      {super.key, required this.selectedToolName, required this.tools});

  final List<Tool> tools;
  final String selectedToolName;

  @override
  Widget build(BuildContext context) {
    final scrollbarThicknessWithTrack =
        _calcScrollbarThicknessWithTrack(context);

    return ListView(
      children: [
        Visibility(
          visible: !isCompactLayout(context),
          child: Container(
              width: Get.width,
              padding: const EdgeInsets.all(8.0),
              height: 50,
              child: LinuxMenuSearchBox(
                tools: tools
                    .map((t) => LinuxMenuItem(t.homeTitle, t.route))
                    .toList(),
                controller: TextEditingController(),
              )),
        ),
        Visibility(visible: !isCompactLayout(context), child: const Divider()),
        Obx(
          () => Column(
            children: <Widget>[
              LinuxMenuTile(
                selected: GlobalSettings.selectedToolName.value ==
                    HomeTool().name.toString(),
                title: YaruPageItemTitle.text(HomeTool().menuTitle),
                icon: HomeTool().icon,
                onTap: () {
                  GlobalSettings.selectedToolName.value =
                      HomeTool().name.toString();
                  Get.toNamed(HomeTool().route);
                },
              ),
              for (Tool tool in GlobalSettings.getFavoriteTools())
                LinuxMenuTile(
                  selected: GlobalSettings.selectedToolName.value == tool.name,
                  title: Text(tool.homeTitle),
                  icon: tool.icon,
                  onTap: () {
                    GlobalSettings.selectedToolName.value = tool.name;
                    Get.toNamed(tool.route);
                  },
                ),
            ]
                .map((e) => Container(
                      padding: isCompactLayout(context)
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
            for (var group in Get.find<List<Group>>())
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: scrollbarThicknessWithTrack,
                  vertical: 8.0,
                ),
                child: Visibility(
                  visible: !isCompactLayout(context),
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
                          mainAxisAlignment: !isCompactLayout(context)
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
                        LinuxMenuTile(
                          selected: GlobalSettings.selectedToolName.value ==
                              tool.runtimeType.toString(),
                          title: YaruPageItemTitle.text(tool.menuTitle),
                          icon: tool.icon,
                          onTap: () {
                            GlobalSettings.selectedToolName.value =
                                tool.runtimeType.toString();
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
