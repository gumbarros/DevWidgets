import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/presentation/tools/controllers/sql_formatter_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SQLFormatterView extends GetView<SQLFormatterController> {
  const SQLFormatterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              DropdownButton(
                  value: "Generic SQL",
                  items: [
                    DropdownMenuItem<String>(
                      child: Text("Generic SQL"),
                      value: "Generic SQL",
                    ),
                  ],
                  onChanged: (selected) {}),
              IconButton(
                icon: Icon(FontAwesomeIcons.fileLines),
                onPressed: () {},
              )
            ],
            title: Text(
              controller.tool.name,
              style: const TextStyle(fontSize: 24),
            )),
        body: Container(
          height: Get.height - kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: Get.width / 2,
                  height: Get.height,
                  child: CodeField(
                    expands: true,
                    controller: controller.inputController,
                  )),
              Container(
                  width: Get.width / 2,
                  height: Get.height,
                  child: CodeField(
                    expands: true,
                    controller: controller.resultController,
                    enabled: false,
                  ))
            ],
          ),
        ));
  }
}
