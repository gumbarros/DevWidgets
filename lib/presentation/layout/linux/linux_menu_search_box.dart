import 'package:devtoys/presentation/layout/linux/linux_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class LinuxMenuSearchBox extends StatelessWidget {
  final TextEditingController controller;
  final List<LinuxMenuItem> tools;
  const LinuxMenuSearchBox(
      {super.key, required this.controller, required this.tools});

  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
        label: "ToolSearchBox",
        initialList: tools,
        getSelectedValue: (LinuxMenuItem value) {
          Get.toNamed(value.route);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 4),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints.expand(width: 40, height: 40),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: YaruRoundIconButton(
              onTap: () {
                controller.text = "";
              },
              child: Icon(Icons.close),
            ),
          ),
          hintText: "menu_search_bar_hint".tr,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: const UnderlineInputBorder(),
        ),
        controller: controller);
  }
}
