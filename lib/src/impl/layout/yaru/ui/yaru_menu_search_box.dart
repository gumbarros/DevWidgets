import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:dev_widgets/src/impl/layout/yaru/models/yaru_menu_item.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class YaruMenuSearchBox extends StatelessWidget {
  final TextEditingController controller;
  final List<LinuxMenuItem> tools;
  const YaruMenuSearchBox(
      {super.key, required this.controller, required this.tools});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<LinuxMenuItem>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          emptyBuilder: (context, searchEntry) {
            return Center(
                child: Text(StringTranslateExtension("no_tools_found").tr()));
          },
        ),
        items: tools,
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
          Get.toNamed(tool?.route ?? Routes.home);
        });
  }
}
