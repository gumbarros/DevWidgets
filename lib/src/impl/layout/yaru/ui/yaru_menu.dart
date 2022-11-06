import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu_header.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu_body.dart';
import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_menu_search_box.dart';
import 'package:flutter/material.dart';

class YaruMenu extends StatelessWidget {
  const YaruMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        YaruMenuSearchBox(),
        Divider(),
        YaruMenuHeader(),
        Divider(),
        YaruMenuBody()
      ],
    );
  }
}
