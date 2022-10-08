import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class MenuSearchBox extends StatelessWidget {
  const MenuSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return TextField(
      expands: true,
      maxLines: null,
      minLines: null,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontSize: 16),
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
      controller: controller,
      autofocus: false,
      onChanged: (_) {},
    );
  }
}
