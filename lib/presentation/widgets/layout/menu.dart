import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/widgets/layout/landscape_layout.dart';
import 'package:devtoys/presentation/widgets/layout/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

const double _kScrollbarThickness = 8.0;
const double _kScrollbarMargin = 2.0;

class Menu extends StatelessWidget {
  const Menu({super.key, required this.selectedIndex, required this.tools});

  final List<Tool> tools;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final scrollbarThicknessWithTrack =
        _calcScrollbarThicknessWithTrack(context);

    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 6.0);
      },
      padding: EdgeInsets.symmetric(
        horizontal: scrollbarThicknessWithTrack,
        vertical: 8.0,
      ),
      controller: ScrollController(),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        return MenuTile(
          selected: index == selectedIndex,
          title: YaruPageItemTitle.text(tools[index].name),
          icon: tools[index].icon,
          onTap: () {
            LandscapeLayout.selectedIndex.value = index;
            Get.toNamed(tools[index].route);
          },
        );
      },
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
