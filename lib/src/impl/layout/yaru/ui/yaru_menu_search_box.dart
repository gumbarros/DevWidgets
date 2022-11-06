import 'package:dev_widgets/src/impl/routes.dart';
import 'package:dev_widgets/src/impl/layout/yaru/models/yaru_menu_item.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class YaruMenuSearchBox extends StatelessWidget {
  const YaruMenuSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<YaruMenuItem>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          emptyBuilder: (context, searchEntry) {
            return Center(
                child: Text(StringTranslateExtension("no_tools_found").tr()));
          },
        ),
        items:
            allTools.map((e) => YaruMenuItem(e.fullTitle, e.route)).toList(),
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
          ),
          prefixIconConstraints:
              const BoxConstraints.expand(width: 40, height: 40),
          hintText: StringTranslateExtension("menu_search_bar_hint").tr(),
          hintStyle: const TextStyle(fontSize: 15),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          border: const UnderlineInputBorder(),
        )),
        onChanged: (tool) {
          context.go(tool?.route ?? Routes.home);
        });
  }
}
