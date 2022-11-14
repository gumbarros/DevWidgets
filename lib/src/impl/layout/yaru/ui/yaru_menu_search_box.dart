import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/models/yaru_menu_item.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class YaruMenuSearchBox extends HookConsumerWidget {
  const YaruMenuSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return DropdownSearch<YaruMenuItem>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          emptyBuilder: (context, searchEntry) {
            return Center(
                child: Text(StringTranslateExtension("no_tools_found").tr()));
          },
        ),
        items: allTools
            .map((e) => YaruMenuItem(e.name, e.fullTitle, e.route))
            .toList(),
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
          ),
          prefixIconConstraints:
              const BoxConstraints.expand(width: 40, height: 40),
          hintText: "menu_search_bar_hint".tr(),
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
          if (tool != null) {
            ref.read(selectedToolProvider.notifier).state =
                getToolByName(tool.name);
            context.go(tool.route);
          }
        });
  }
}
