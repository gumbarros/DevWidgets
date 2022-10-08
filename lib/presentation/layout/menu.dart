import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/layout/landscape_layout.dart';
import 'package:devtoys/presentation/layout/menu_search_box.dart';
import 'package:devtoys/presentation/layout/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

const double _kScrollbarThickness = 8.0;
const double _kScrollbarMargin = 2.0;

class Menu extends StatelessWidget {
  const Menu({super.key, required this.selectedToolName, required this.tools});

  final List<Tool> tools;
  final String selectedToolName;

  @override
  Widget build(BuildContext context) {
    final scrollbarThicknessWithTrack =
        _calcScrollbarThicknessWithTrack(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scrollbarThicknessWithTrack,
            vertical: 8.0,
          ),
          child: MenuTile(
            padding: EdgeInsets.zero,
            selected: LandscapeLayout.selectedToolName.value ==
                HomeTool().runtimeType.toString(),
            title: YaruPageItemTitle.text(HomeTool().homeTitle),
            icon: HomeTool().icon,
            onTap: () {
              LandscapeLayout.selectedToolName.value =
                  HomeTool().runtimeType.toString();
              Get.toNamed(HomeTool().route);
            },
          ),
        ),
        Visibility(
          visible: !LandscapeLayout.compactMode.value,
          child: SizedBox(
              width: Get.width,
              height: Get.height / 20,
              child: MenuSearchBox()),
        ),
        Divider(),
        ListView(
          shrinkWrap: true,
          semanticChildCount: tools.length,
          padding: EdgeInsets.symmetric(
            horizontal: scrollbarThicknessWithTrack,
            vertical: 8.0,
          ),
          children: [
            for (var group in Get.find<List<Group>>())
              Visibility(
                visible: !LandscapeLayout.compactMode.value,
                replacement: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: FaIcon(
                        group.icon,
                        size: 18,
                      ),
                      onPressed: () {
                        Get.toNamed('/home', arguments: [group.name]);
                      }),
                ),
                child: YaruExpandable(
                  isExpanded: true,
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: LandscapeLayout.compactMode.value
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          FaIcon(
                            group.icon,
                            size: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              group.name,
                              overflow: TextOverflow.fade,
                              style: TextStyle(fontSize: 17),
                            ),
                          )
                        ]),
                  ),
                  child: Column(children: [
                    for (var tool
                        in tools.where((t) => t.group.name == group.name))
                      MenuTile(
                        selected: LandscapeLayout.selectedToolName.value ==
                            tool.runtimeType.toString(),
                        title: YaruPageItemTitle.text(tool.homeTitle),
                        icon: tool.icon,
                        onTap: () {
                          LandscapeLayout.selectedToolName.value =
                              tool.runtimeType.toString();
                          Get.toNamed(tool.route);
                        },
                      )
                  ]),
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
