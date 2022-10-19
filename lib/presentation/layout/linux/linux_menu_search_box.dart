import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/presentation/layout/linux/linux_menu_item.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinuxMenuSearchBox extends StatelessWidget {
  final TextEditingController controller;
  final List<LinuxMenuItem> tools;
  const LinuxMenuSearchBox(
      {super.key, required this.controller, required this.tools});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<LinuxMenuItem>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          emptyBuilder: (context, searchEntry) {
            return Center(child: Text("no_tools_found".tr));
          },
        ),
        items: tools,
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
          ),
          prefixIconConstraints: BoxConstraints.expand(width: 40, height: 40),
          hintText: "menu_search_bar_hint".tr,
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
