import 'package:devtoys/presentation/formatters/controllers/sql_formatter_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SQLFormatterView extends GetView<SQLFormatterController> {
  const SQLFormatterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.title),
        body: Container(
          height: Get.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("configuration".tr, style: TextStyle(fontSize: 20)),
                      YaruSection(children: [])
                    ]),
              ),
              Container(
                  height: Get.height / 1.2,
                  child: IOEditor(
                    inputController: controller.inputController,
                    outputController: controller.outputController,
                  )),
            ],
          ),
        ));
  }
}
